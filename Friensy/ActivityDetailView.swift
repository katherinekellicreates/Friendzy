//
//  ActivityDetailView.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/29/26.
//

import SwiftUI
import MapKit

struct ActivityDetailView: View {
    let activity: Activity
    
    @StateObject private var locationManager: LocationManager
    @State private var startPosition = MapCameraPosition.automatic
    @State private var mapRegion = MKCoordinateRegion()
    @State private var places: [Place] = []
    @State private var radius: Double = 20
    @State private var userLocation: CLLocationCoordinate2D?
    
    init(appState: AppStateManager, activity: Activity) {
        self.activity = activity
        self ._locationManager = StateObject(
            wrappedValue: LocationManager(state: appState)
        )
    }
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Text(activity.name)
                    .font(Font.custom("Bodoni 72 Oldstyle", size: 35))
                
                VStack(spacing: 10) {
                    
                    HStack(spacing: 20) {
                        Text("Energy: \(activity.energyLevel.emoji)")
                        Text("Cost: \(activity.priceLevel.display)")
                        
                        if activity.requiresFocus {
                            Text("🧠 Focus")
                        } else {
                            Text("😌 Chill")
                        }
                    }
                    .font(.headline)
                }
                
                if activity.goOut {
                    VStack(spacing: 8) {
                        Text("Radius")
                        
                        Picker("Radius", selection: $radius) {
                            Text("2 mi").tag(2.0)
                            Text("5 mi").tag(5.0)
                            Text("10 mi").tag(10.0)
                            Text("15 mi").tag(15.0)
                            Text("20 mi").tag(20.0)
                            Text("25+ mi").tag(25.0)
                        }
                        .pickerStyle(.segmented)
                        .scaleEffect(0.9)
                    }
                    .padding()
                    
                    Map(position: $startPosition) {
                        UserAnnotation()
                        
                        if let location = locationManager.userLocation {
                            MapCircle(
                                center: location,
                                radius: radius * 1609.34
                            )
                            .foregroundStyle(.pink.opacity(0.15))
                        }
                        
                        ForEach(places) { place in
                            Annotation(
                                place.mapItem.name ?? "",
                                coordinate: place.mapItem.placemark.coordinate
                            ) {
                                NavigationLink(
                                    destination: PlaceDetails(mapItem: place.mapItem)
                                ) {
                                    VStack {
                                        Text("⭐️")
                                            .font(.system(size: 45))
                                        
                                        Text(place.mapItem.name ?? "")
                                            .font(.caption)
                                            .foregroundColor(.black)
                                            .lineLimit(1)
                                    }
                                }
                            }
                        }
                    }
                    .onAppear {
                        startPosition = .userLocation(fallback: .automatic)
                        updateCamera()
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            performSearch()
                        }
                    }
                    .onChange(of: radius) {
                        updateCamera()
                        performSearch()
                    }
                    .onMapCameraChange { context in
                        mapRegion = context.region
                    }
                    .onMapCameraChange { context in
                        mapRegion = context.region
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.pink.opacity(0.4)), lineWidth: 10)
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Locations near you")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)
                        
                        if places.isEmpty {
                            Text("No locations found within \(Int(radius)) miles")
                                .foregroundColor(.gray)
                                .padding(.horizontal)
                        } else {
                            
                            ForEach(places.prefix(10)) { place in
                                
                                NavigationLink(
                                    destination: PlaceDetails(mapItem: place.mapItem)
                                ) {
                                    HStack(spacing: 12) {
                                        
                                        Text("⭐️")
                                            .font(.title2)
                                        
                                        VStack(alignment: .leading) {
                                            Text(place.mapItem.name ?? "Unknown")
                                                .font(.headline)
                                            
                                            if let locality = place.mapItem.placemark.locality {
                                                Text(locality)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                                
                                                Text("\(place.distance / 1609.34, specifier: "%.1f") mi away")
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                            }
                        }
                    }
                    .padding(.bottom)
                }
                
                Spacer()
            }
            .onAppear {
                startPosition = .userLocation(fallback: .automatic)
            }
        }
    }
    
    func performSearch() {
        let queries = searchQueriesForActivity()
        
        var allResults: [MKMapItem] = []
        let group = DispatchGroup()
        
        for query in queries {
            group.enter()
            
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = query
            request.region = mapRegion
            
            let search = MKLocalSearch(request: request)
            
            search.start { response, _ in
                if let items = response?.mapItems {
                    allResults.append(contentsOf: items)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            
            let userLoc = locationManager.userLocation
            
            var uniqueItems: [MKMapItem] = []
            var seenNames: Set<String> = []
            
            for item in allResults {
                if let name = item.name, !seenNames.contains(name) {
                    seenNames.insert(name)
                    uniqueItems.append(item)
                }
            }
            
            let maxDistance = radius * 1609.34 // miles → meters

            places = uniqueItems.compactMap { item in
                guard let userLoc = userLoc,
                      let itemLocation = item.placemark.location else { return nil }
                
                let userCL = CLLocation(latitude: userLoc.latitude, longitude: userLoc.longitude)
                let distance = userCL.distance(from: itemLocation)

                if distance <= maxDistance {
                    return Place(mapItem: item, distance: distance)
                } else {
                    return nil
                }
            }

            places.sort { $0.distance < $1.distance }
        }
    }
    
    func searchQueriesForActivity() -> [String] {
        switch activity.name {
        case "Escape room":
            return ["escape room", "puzzle room"]
        case "Bowling":
            return ["bowling alley", "bowling"]
        case "Arcade":
            return ["arcade", "game center"]
        case "Mini golf":
            return ["mini golf"]
        case "Amusement Park":
            return ["amusement park", "theme park"]
        case "Hiking":
            return ["hiking trail", "nature preserve"]
        case "Thrifting":
            return ["thrift store", "Goodwill", "Salvation Army", "House of Hope"]
        case "Go To a Sports Game":
            return ["sports", "stadium", "arena"]
        default:
            return [activity.name]
        }
    }
    
    func updateCamera() {
        if let location = locationManager.userLocation {
            
            let distance = radius * 1609.34
            
            startPosition = .region(
                MKCoordinateRegion(
                    center: location,
                    span: MKCoordinateSpan(
                        latitudeDelta: distance / 111000,
                        longitudeDelta: distance / 111000
                    )
                )
            )
        }
    }
    
}

struct Place: Identifiable {
    let id = UUID()
    let mapItem: MKMapItem
    var distance: Double = 0
}

#Preview {
    ActivityDetailView(
        appState: AppStateManager(),
        activity: Activity(
            name: "Escape room",
            minPeople: 2,
            isDate: true,
            locationRequirement: .indoor,
            goOut: true,
            types: ["Experiences"],
            energyLevel: .medium,
            priceLevel: .medium,
            requiresFocus: true,
            seasons: [.winter, .spring, .summer, .fall]
        )
    )
}

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
    @State private var maxRadius = true
    
    init(appState: AppStateManager, activity: Activity) {
        self.activity = activity
        self ._locationManager = StateObject(
            wrappedValue: LocationManager(state: appState)
        )
    }
    var body: some View {
        ZStack {
            Color("Teal").ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text(activity.name)
                        .font(Font.custom("BPreplay-bold", size: 35))
                        .foregroundColor(.white)
                    
                    VStack(spacing: 10) {
                        
                        HStack(spacing: 20) {
                            Text("Energy: \(activity.energyLevel.emoji)")
                                .font(Font.custom("BPreplay", size: 20))
                                .foregroundColor(.white)
                            Text("Cost: \(activity.priceLevel.display)")
                                .font(Font.custom("BPreplay", size: 20))
                                .foregroundColor(.white)
                            
                            if activity.requiresFocus {
                                Text("🧠 Focus")
                                    .font(Font.custom("BPreplay", size: 20))
                                    .foregroundColor(.white)
                            } else {
                                Text("😌 Chill")
                                    .font(Font.custom("BPreplay", size: 20))
                                    .foregroundColor(.white)
                            }
                        }
                        .font(.headline)
                    }
                    
                    if activity.goOut {
                        VStack(spacing: 8) {
                            Text("Radius")
                                .font(Font.custom("BPreplay-Bold", size: 23))
                                .foregroundColor(.white)
                            
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
                                .foregroundStyle(.teal2.opacity(0.15))
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
                                                .font(Font.custom("BPreplay-Bold", size: 20))
                                                .font(.caption)
                                                .foregroundColor(.white)
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
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                performSearch()
                            }
                        }
                        .onMapCameraChange { context in
                            mapRegion = context.region
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(.teal2.opacity(0.8)), lineWidth: 10)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Locations near you")
                                .font(Font.custom("BPreplay-Bold", size: 20))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            
                            if places.isEmpty {
                                if radius < 25 {
                                    VStack(spacing: 10) {
                                        Text("No locations found within \(Int(radius)) miles")
                                            .font(Font.custom("BPreplay", size: 18))
                                            .foregroundColor(.white)
                                        
                                        Button("Increase Radius") {
                                            increaseRadius()
                                        }
                                        .font(Font.custom("BPreplay-Bold", size: 20))
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color.teal2.opacity(0.3))
                                        .cornerRadius(8)
                                    }
                                    
                                } else {
                                    Text("No locations found within any radius")
                                        .font(Font.custom("BPreplay-Bold", size: 18))
                                        .foregroundColor(.white)
                                }
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
                                                    .font(Font.custom("BPreplay", size: 20))
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                
                                                if let locality = place.mapItem.placemark.locality {
                                                    Text(locality)
                                                        .font(.caption)
                                                        .foregroundColor(.white)
                                                    
                                                    Text("\(place.distance / 1609.34, specifier: "%.1f") mi away")
                                                        .font(Font.custom("BPreplay", size: 18))
                                                        .foregroundColor(.white)
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
    }
        
        func performSearch() {
            let queries = searchQueriesForActivity()
            
            var allResults: [MKMapItem] = []
            let group = DispatchGroup()
            
            for query in queries {
                group.enter()
                
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = query
                if let userLoc = locationManager.userLocation {
                    let bigSpan = MKCoordinateSpan(
                        latitudeDelta: (25 * 1609.34) / 111000,
                        longitudeDelta: (25 * 1609.34) / 111000
                    )
                    
                    request.region = MKCoordinateRegion(
                        center: userLoc,
                        span: bigSpan
                    )
                }
                
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
                
                let selectedRadiusMeters = radius * 1609.34
                let maxRadiusMeters = 25 * 1609.34
                
                var filteredPlaces: [Place] = []
                var placesAtMaxRadius: [Place] = []
                
                for item in uniqueItems {
                    guard let userLoc = userLoc,
                          let itemLocation = item.placemark.location else { continue }
                    let userCL = CLLocation(latitude: userLoc.latitude, longitude: userLoc.longitude)
                    let distance = userCL.distance(from: itemLocation)
                    
                    let place = Place(mapItem: item, distance: distance)
                    if distance <= selectedRadiusMeters {
                        filteredPlaces.append(place)
                    }
                    if distance <= maxRadiusMeters {
                        placesAtMaxRadius.append(place)
                    }
                }
                // assign filtered results
                places = filteredPlaces.sorted { $0.distance < $1.distance }
                // track if anything exists at max radius
                maxRadius = !placesAtMaxRadius.isEmpty
            }
        }
        
        func searchQueriesForActivity() -> [String] {
            switch activity.name {
            case "Escape room":
                return ["escape room", "puzzle room"]
            case "Bowling":
                return ["bowling alley", "bowling", "lanes"]
            case "Arcade":
                return ["arcade", "game center"]
            case "Mini golf":
                return ["mini golf"]
            case "Amusement Park":
                return ["amusement park", "theme park"]
            case "Hiking":
                return ["hiking trail", "nature preserve"]
            case "Thrifting":
                return ["thrift", "thrifting", "thrift store", "Goodwill", "Salvation Army", "House of Hope"]
            case "Go To a Sports Game":
                return ["sports", "stadium", "arena"]
            case "Bookstore Shopping":
                return ["bookstore", "bookshop", "Barnes & Noble", "book store", "book shop", "book"]
            case "Coffee Run":
                return ["coffee", "Starbucks", "Dunkin Donuts", "coffee shop", "cafe"]
// TEMPLATE!
//            case "EXACT Activity Name":
//                return ["EXACT Activity Name", "another search term", "another search term", "etc", "add as many search terms as need be!"]
            default:
                return [activity.name]
            }
        }
        
        func updateCamera() {
            if let location = locationManager.userLocation {
                
                let distance = radius * 1609.34 * 2.4
                
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
        
        func increaseRadius() {
            let options: [Double] = [2, 5, 10, 15, 20, 25]
            
            if let index = options.firstIndex(of: radius),
               index < options.count - 1 {
                radius = options[index + 1]
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

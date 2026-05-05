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
                }
                .onChange(of: radius) {
                    updateCamera()
                }
                .onMapCameraChange { context in
                    mapRegion = context.region
                    performSearch()
                }
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(.pink.opacity(0.4)), lineWidth: 6)
                )
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
            }
            
            Spacer()
        }
        .onAppear {
            startPosition = .userLocation(fallback: .automatic)
        }
    }
    
    func performSearch() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQueryForActivity()
        request.region = mapRegion
        request.region = mapRegion
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            if let response = response {
                places = response.mapItems.map { Place(mapItem: $0) }
            }
        }
    }
    
    func searchQueryForActivity() -> String {
        switch activity.name {
        case "Escape room":
            return "escape room"
        case "Bowling":
            return "bowling alley"
        case "Arcade":
            return "arcade"
        case "Mini golf":
            return "mini golf"
        case "Amusement Park":
            return "amusement park"
        case "Hiking":
            return "hiking trail"
        default:
            return activity.name
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

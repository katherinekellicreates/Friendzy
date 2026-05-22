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
                            .font(.system(size: 16, weight: .bold))
                            .frame(height: 45)
                            .padding(.horizontal, 25)
                        }
                        .padding()
                        
                        Group {
                            
                            if let location = locationManager.userLocation {
                                
                                Map(position: $startPosition) {
                                    
                                    UserAnnotation()
                                    
                                    MapCircle(
                                        center: location,
                                        radius: radius * 1609.34
                                    )
                                    .foregroundStyle(.ourYellow.opacity(0.45))
                                    
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
                                                        .font(.system(size: 27))
                                                    
                                                    Text(place.mapItem.name ?? "")
                                                        .font(Font.custom("BPreplay-Bold", size: 9))
                                                        .foregroundColor(.teal2)
                                                        .lineLimit(1)
                                                }
                                            }
                                        }
                                    }
                                }
                                .onAppear {
                                    
                                    updateCamera()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
                                
                            } else {
                                
                                ZStack {
                                    Color.teal2.opacity(0.1)
                                    
                                    Text("Loading map...")
                                        .font(.custom("BPreplay", size: 20))
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(.ourYellow.opacity(0.8)), lineWidth: 10)
                        )
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
                                        .frame(width: 200)
                                        .padding()
                                        .background(Color.ourYellow)
                                        .foregroundColor(.teal)
                                        .cornerRadius(12)
                                        .frame(maxWidth: .infinity)
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
                                Button("Increase Radius") {
                                    increaseRadius()
                                }
                                .font(Font.custom("BPreplay-Bold", size: 20))
                                .frame(width: 200)
                                .padding()
                                .background(Color.ourYellow)
                                .foregroundColor(.teal)
                                .cornerRadius(12)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding(.bottom)
                    }
                    
                    Spacer()
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
                return ["escape room", "puzzle room", "escape game",]
            case "Roller Skating":
                return ["Rink", "roller skating rink", "roller skating",]
            case "Ice Skating":
                return ["Rink", "skating rink", "ice skating",]
            case "Bowling":
                return ["bowling alley", "bowling", "lanes"]
            case "Arcade":
                return ["arcade", "game center"]
            case "Mini golf":
                return ["mini golf", "golf course", "miniature golf"]
            case "Picnic":
                return ["Park"]
            case "Zoo":
                return ["Zoo"]
            case "Beach Day":
                return ["Beach"]
            case "Restaurant":
                return ["Restaurant", "dining"]
            case "Workout":
                return ["Gym", "fitness center"]
            case "Concert":
                return ["Stadiums", "arena", "concert venue", "concert hall"]
            case "See a live-action show":
                return ["Theatre", "theater", "playhouse","Auditorium","Medieval times","improv"]
            case "Murder mystery dinner":
                return ["Murder mystery dinner", "Murder Mystery"]
            case "Museum":
                return ["Museum", "art museum"]
            case "Drive-in Movie":
                return ["Drive-in movie", "drive-in"]
            case "Stargazing":
                return ["Park"]
            case "Rooftop Dinner":
                return ["rooftop restaurant", "rooftop bar","rooftop"]
            case "Watch the sunset":
                return ["park"]
            case "Pottery":
                return ["Ceriamics", "Pottery","color me mine","Clay Monet"]
            case "Painting":
                return ["color me mine","Pinot's Palette","Clay Monet"]
            case "Learn a new skill":
                return ["Art Classes", "cooking class", ]
            case "Rock Climbing":
                return ["Rock Climbing", "rock climbing gym","climbing gym"]
            case "Haunted House":
                return ["Haunted House"]
            case "Apple Picking":
                return ["apple picking", "apple orchard"]
            case "Corn Maze":
                return ["Corn maze", "corn mazes"]
            case "Pumpkin Patch":
                return ["Pumpkin Patch", "fall festival","Goberts"]
            case "Record Store":
                return ["Record Store", "record shop","vinyl store","vinyl record store"]
            case "Opera House":
                return ["Opera House", "opera house", "opera"]
            case "Water Park":
                return ["Water Park","Great Wolf Lodge"]
            case "Festival":
                return ["Festival", "festival venue", "festival hall"]
            case "Shopping":
                return ["Apple Store", "Shopping", "mall", "outlet", "department store", "department stores", "outlet mall", "outlet stores", "outlet", "outlet center"]
            case "Trampoline Park":
                return ["Trampoline Park","Jump Park","urban air","sky zone",]
            case "Laser Tag":
                return ["Laser Tag", "laser tag arena", "main event","battle house"]
            case "Amusement Park":
                return ["amusement park", "theme park","fair","six flags","disneyland","disney world","universal studios","state fair","roller coaster"]
            case "Nature Walk":
                return ["Nature", "forest", "park","preserve","nature preserve","trail"]
            case "Hiking":
                return ["hiking trail", "nature preserve"]
            case "Thrifting":
                return ["thrift", "thrifting", "thrift store", "Goodwill", "Salvation Army", "House of Hope","Savers","Platos Closet"]
            case "Go To a Sports Game":
                return ["sports", "stadium", "arena"]
            case "Book Shopping":
                return ["bookstore", "bookshop", "Barnes & Noble", "book store", "book shop", "book"]
            case "Coffee Run":
                return ["coffee", "Starbucks", "Dunkin Donuts", "coffee shop", "cafe"]
            case "Go Downtown":
                return ["Train station", "Train"]
// TEMPLATE!
//            case "EXACT Activity Name":
//                return ["EXACT Activity Name", "another search term", "another search term", "etc", "add as many search terms as need be!"]
                
//            case "":
//                return [""]
            default:
                return [activity.name]
            }
        }
        
        func updateCamera() {
            if let location = locationManager.userLocation {
                
                let distance = radius * 1609.34 * 2.1
                
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
                types: [.experiences,.problemsolving,.social,.competitive],
                energyLevel: .medium,
                priceLevel: .medium,
                requiresFocus: true,
                seasons: [.winter, .spring, .summer, .fall]
            )
        )
    }

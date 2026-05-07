//
//  Where.swift
//  Friensy
//
//  Created by Maya Krishnan on 4/21/26.
//

import SwiftUI
import MapKit

struct Where: View {
    @EnvironmentObject var appState: AppStateManager
    @State private var startPosition = MapCameraPosition.automatic
    @State private var radius: Double = 5

    @StateObject private var weatherManager = WeatherManager()
    @StateObject private var locationManager: LocationManager
    
    init(appState: AppStateManager) {
        _locationManager = StateObject(
            wrappedValue: LocationManager(state: appState)
        )
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("Where?")
                        .font(Font.custom("BPreplay-Bold", size: 45))
                        .foregroundStyle(.white)
                  
                    VStack(spacing: 10) {
                        Text("Weather")
                            .font(Font.custom("BPreplay-Bold", size: 20))
                            .foregroundStyle(.white)
                        if weatherManager.temperature != 0 {
                            Text("\(weatherEmoji()) \(Int(weatherManager.temperature))°F")
                                .font(.custom("BPreplay-Bold", size: 30))
                                .foregroundStyle(.white)
                        } else {
                            Text("Loading weather...")
                                .font(.custom("BPreplay", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                
                    VStack(spacing: 4) {
                        Text("Season")
                            .font(Font.custom("BPreplay-Bold", size: 20))
                            .foregroundStyle(.white)
                        Text(appState.state.currentSeason.rawValue.capitalized)
                            .font(.custom("BPreplay", size: 25))
                            .foregroundStyle(.white)
                            
                        
                    }
                    
                    
                    .padding(15)
                    VStack(spacing: 5) {
                            
                        Picker("", selection: $appState.state.selectedLocation) {
                            Text("Indoor").tag(LocationRequirement.indoor)
                            
                            Text("Outdoor").tag(LocationRequirement.outdoor)
                        }
                        .font((Font.custom("BPreplay", size: 20)))
                        .pickerStyle (.segmented)
                        .frame(width: 260, height: 40)
                    }
                    
                    VStack(spacing: 8) {
                        Text("Location")
                            .font(Font.custom("BPreplay-Bold", size: 20))
                            .foregroundStyle(.white)
                        
                        if locationManager.city != "" {
                            
                            Text("\(locationManager.city), \(locationManager.zip)")
                                .font(.custom("BPreplay", size: 30))
                                .foregroundStyle(.white)
                            
                        } else {
                            Text("Fetching location...")
                                .font(.custom("BPreplay", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    
                    VStack(spacing: 8) {
                        Text("Radius")
                            .font(.custom("BPreplay-bold", size: 20))
                            .foregroundStyle(.white)

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
                    
                    let radiusInMeters = radius * 1609.34
                    
                    Group {
                        if let location = locationManager.userLocation {
                            
                            
                            Map(position: $startPosition) {
                                UserAnnotation()
                                
                                MapCircle(
                                    center: location,
                                    radius: radius * 1609.34
                                )
                                .foregroundStyle(.ourYellow.opacity(0.3))
                            }
                            .onAppear {
                                updateCamera()
                                
                                if let location = locationManager.userLocation {
                                       weatherManager.fetchWeather(
                                           lat: location.latitude,
                                           lon: location.longitude
                                       )
                                   }
                            }
                            .onChange(of: radius) {
                                updateCamera()
                            }
                            .onChange(of: locationManager.userLocation?.latitude) {
                                guard let location = locationManager.userLocation else { return }
                                
                                weatherManager.fetchWeather(
                                    lat: location.latitude,
                                    lon: location.longitude
                                )
                                
                                updateCamera()
                            }
                        
                        } else {
                            ZStack {
                                Color.teal2.opacity(0.1)
                                Text("Loading map...")
                                    .font(.custom("BPreplay", size: 20))
                                    .foregroundStyle(.white)
                            }
                            .frame(height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                    
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color(.ourYellow.opacity(0.8)), lineWidth: 10)
                        )
                    .onChange(of: radius) {
                        updateCamera()
                    }
                    .onAppear {
                        updateCamera()
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    NavigationLink(destination: Tellmemore()) {
                        Text("Next")
                            .frame(width: 100)
                            .font(Font.custom("BPreplay-Bold", size: 45))
                            .padding()
                            .background(Color(.ourYellow))
                            .foregroundStyle(.teal)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.top, 20)
                    .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
                    Spacer()
                }
            }
            .navigationViewStyle(.stack)
           // .padding(.bottom, 40)
            .background(Color("Teal"))
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
    
    func weatherEmoji() -> String {
        switch weatherManager.condition {
        case "Clear": return "☀️"
        case "Clouds": return "⛅"
        case "Rain": return "🌧️"
        case "Thunderstorm": return "🌩️"
        case "Snow": return "❄️"
        default: return "🌤️"
        }
    }
}
#Preview {
    Where(appState: AppStateManager())
        .environmentObject(AppStateManager())
}

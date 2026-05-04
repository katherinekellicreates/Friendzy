//
//  PlaceDetails.swift
//  Friensy
//
//  Created by Maya Krishnan on 5/4/26.
//

import SwiftUI
import MapKit

struct PlaceDetails: View {
    let mapItem: MKMapItem
    var body: some View {
        let placemark = mapItem.placemark
        
        let address = [
            placemark.subThoroughfare,
            placemark.thoroughfare,
            placemark.locality,
            placemark.administrativeArea,
            placemark.postalCode
        ]
        .compactMap { $0 }
        .joined(separator: ", ")
        
        VStack(spacing: 20) {
            
            Text(mapItem.name ?? "Unknown Place")
                .font(.title)
                .bold()
            
            Text(address)
                .multilineTextAlignment(.center)
            
            if let phone = mapItem.phoneNumber {
                Text(phone)
            }
            
            if let url = mapItem.url {
                Link("Website", destination: url)
            }
            
            Button("Open in Maps") {
                let coordinate = placemark.coordinate
                let url = URL(string: "maps://?daddr=\(coordinate.latitude),\(coordinate.longitude)")
                
                if let url = url {
                    UIApplication.shared.open(url)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    let mockItem = MKMapItem(placemark: MKPlacemark(
        coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    ))
    mockItem.name = "Sample Place"
    
    return PlaceDetails(mapItem: mockItem)
}

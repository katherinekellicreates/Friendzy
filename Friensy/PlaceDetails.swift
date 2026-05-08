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
        ZStack {
            Color("Teal").ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                
                Text(mapItem.name ?? "Unknown Place")
                    .font(Font.custom("BPreplay-bold", size: 35))
                    .foregroundColor(.white)
                
                Text(address)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("BPreplay", size: 20))
                    .foregroundColor(.white)
                
                if let phone = mapItem.phoneNumber {
                    Text(phone)
                        .font(Font.custom("BPreplay", size: 20))
                        .foregroundColor(.white)
                }
                
                if let url = mapItem.url {
                    Link("Website", destination: url)
                        .font(Font.custom("BPreplay", size: 20))
                        .foregroundColor(.white)
                }
                
                Button("Open in Maps") {
                    let coordinate = placemark.coordinate
                    let url = URL(string: "maps://?daddr=\(coordinate.latitude),\(coordinate.longitude)")
                    
                    if let url = url {
                        UIApplication.shared.open(url)
                        
                    }
                }
                .font(Font.custom("BPreplay-bold", size: 23))
                .frame(width: 170)
                .padding()
                .background(Color.teal2)
                .foregroundColor(.white)
                .cornerRadius(12)
                .frame(maxWidth: .infinity)
                //.font(Font.custom("BPreplay", size: 20))
              //  .foregroundColor(.white)
                Spacer()
            }
            .padding()
            .background(Color("Teal").ignoresSafeArea())
        }
    }
}
#Preview {
    let mockItem = MKMapItem(placemark: MKPlacemark(
        coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
    ))
    mockItem.name = "Sample Place"
    
    return PlaceDetails(mapItem: mockItem)
}

//
//  MapView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var mapCameraPostion = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.600286,
                longitude: 16.4377599),
            span: MKCoordinateSpan(
                latitudeDelta: 60.0,
                longitudeDelta: 60.0
            )
        )
    )
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    @State private var latitude = 6.600286
    @State private var longitude = 6.600286

     var body: some View {
        
        Map(position: $mapCameraPostion) {
            
            ForEach(locations) { location in
                
                Annotation(location.name, coordinate: location.location) {
                    
                    MapAnnotationView(location: location )
                }
            }
        }
        .onMapCameraChange(frequency: .continuous, {
            latitude = $0.region.center.latitude
            longitude = $0.region.center.longitude
        })
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                      Text("Latitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                      Spacer()
                        Text("\(latitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                      Text("Longitude:")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.accentColor)
                      Spacer()
                        Text("\(longitude)")
                        .font(.footnote)
                        .foregroundColor(.white)
                    }
                  }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .clipShape(
                            RoundedRectangle(cornerRadius: 8)
                        )
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}

#Preview {
    MapView()
}

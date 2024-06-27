//
//  LocationModel.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import MapKit

struct NationalParkLocation : Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
     var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

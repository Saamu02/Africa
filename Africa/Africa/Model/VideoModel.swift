//
//  VideoModel.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String 
    
    // Computed Property
    var thumbnail: String {
        return "video-\(id)"
    }
}

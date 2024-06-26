//
//  Bundle+Extension.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String ) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to parse \(file) from bundle")
        }
        
        return decodedData
    }
}

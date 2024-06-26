//
//  CoverImageView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    var body: some View {
        
        TabView {
            
            ForEach(coverImages) { image in
                Image(image.name)
                    .resizable()
                .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

#Preview(traits: .fixedLayout(width: 400, height: 300)) {
    CoverImageView()
}

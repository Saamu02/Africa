//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct InsetGalleryView: View {
    
    let animal: Animal
    
    var body: some View {
        
        ScrollView(.horizontal) {
            
            HStack(alignment: .center, spacing: 15 ) {
                
                ForEach(animal.gallery, id: \.self) { image in
                    
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 12)
                        )
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return InsetGalleryView(animal: animals[0])
        .padding()
}

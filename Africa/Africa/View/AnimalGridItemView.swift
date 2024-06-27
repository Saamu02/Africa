//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: Animal
    
    var body: some View {
        
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")

    return AnimalGridItemView(animal: animals[0 ])
        .padding()
}

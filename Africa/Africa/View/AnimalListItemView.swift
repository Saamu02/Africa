//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animal: Animal
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 16) {
            
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.accent)
                
                Text(animal.headline)
                    .font(.footnote )
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return AnimalListItemView(animal: animals[1])
        .padding()
}

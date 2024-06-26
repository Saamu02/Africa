//
//  InsetFactView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct InsetFactView: View {
    
    let animal: Animal
    
    var body: some View {
        
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { fact in
                    Text(fact)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")

    return InsetFactView(animal: animals[0])
        .padding()
}

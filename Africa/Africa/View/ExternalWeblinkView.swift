//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    let animal: Animal
    
    var body: some View {
        
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia ")
                Spacer()
                
                Group {
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://www.wikipedia.org/")!)

                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundStyle(.accent)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return ExternalWeblinkView(animal: animals[0])
        .padding()
}
 

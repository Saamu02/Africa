//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            VStack(alignment: .center, spacing: 20) {
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundStyle(.primary)
                    .underline(color: .accent)
                    .baselineOffset(10)
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
                    .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                }
                .padding(.horizontal)
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More ")
                    
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Learn about \(animal.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    return NavigationStack {
         AnimalDetailView(animal: animals[0])
    }
}

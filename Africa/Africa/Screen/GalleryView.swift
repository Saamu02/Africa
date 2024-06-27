//
//  GalleryView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct GalleryView: View {
         
    @State private var selectedAnimal = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
        
    //Dynamic grid layout
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn = 3.0
    
    let hapticFeedBack = UINotificationFeedbackGenerator()
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn) )
    }
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            VStack(alignment: .center, spacing: 30 ) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 8 )
                    )
                
                Slider(value: $gridColumn, in: 2...4)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) {
                        
                        withAnimation(.easeIn) {
                            gridSwitch()
                        }
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
                    ForEach(animals) { animal in 
                        
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 1 )
                            )
                            .onTapGesture {
                                hapticFeedBack.notificationOccurred(.success)
                                selectedAnimal = animal.image
                            }
                    }
                }
                .onAppear {
                    gridSwitch()
                }
            }
            .padding(.horizontal, 10 )
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

#Preview {
    GalleryView()
}

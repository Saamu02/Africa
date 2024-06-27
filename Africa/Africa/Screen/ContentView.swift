//
//  ContentView.swift
//  Africa
//
//  Created by Ussama Irfan on 26/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isGridViewActive = false
    
    //Dynamic grid layout
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn = 2
    @State private var toolbarIcon = "square.grid.2x2"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticFeedBack = UINotificationFeedbackGenerator()
    
    func gridSwitch() {
        gridLayout = Array(repeating: GridItem(.flexible()), count: (gridLayout.count % 3) + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        
        case 1:
            toolbarIcon = "square.grid.2x2"
          
        case 2:
            toolbarIcon = "square.grid.3x2"

        case 3:
            toolbarIcon = "rectangle.grid.1x2"
            
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            Group {
                
                if !isGridViewActive {
                    
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        
                        ForEach(animals) { animal in
                            
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                            .listRowBackground(Color.clear)
                        }
                    }
                    
                } else {
                    
                    ScrollView(.vertical) {
                        
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            
                            ForEach(animals) { animal in
                                
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding()
                        .onAppear {
                            gridSwitch()
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                    HStack(spacing: 16)  {
                        
                        Button(action: {
                            isGridViewActive = false
                            hapticFeedBack.notificationOccurred(.success)
                            
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .primary : Color.accent )
                        })
                        
                        Button(action: {
                            isGridViewActive = true
                            hapticFeedBack.notificationOccurred(.success)
                            
                            withAnimation(.easeIn) {
                                 gridSwitch()
                            }
                            
                        }, label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .primary)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

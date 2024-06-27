//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import SwiftUI

struct MapAnnotationView: View {
    
    var location: NationalParkLocation
    
    @State private var animation = 0.0
     
    var body: some View {
        
        ZStack {
            
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                 animation = 1
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    return  MapAnnotationView(location: locations[0])
        .padding()
}

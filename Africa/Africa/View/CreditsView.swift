//
//  CreditsView.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Ussama Irfan
    All right reserved
    Better apps ♡ less code
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CreditsView()
        .padding()
}

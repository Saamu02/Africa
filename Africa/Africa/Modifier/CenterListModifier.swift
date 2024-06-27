//
//  CenterListModifier.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import SwiftUI

struct CenterListModifier: ViewModifier {
    
    func body(content: Content) -> some View {
         
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
 

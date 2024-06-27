//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Ussama Irfan on 27/06/2024.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    
    func randomSize() -> CGFloat {
        CGFloat.random(in:  10...300 )
    }
    
    func randomScale() -> CGFloat {
        CGFloat.random(in: 0.1...2.0)
    }
    
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundStyle(.gray )
                        .opacity(0.25)
                        .frame(
                            width: randomSize(),
                            height: randomSize(),
                            alignment: .center
                        )
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height )
                        )
                        .scaleEffect(isAnimating ? randomScale() :   1 )
                        .onAppear {
                            withAnimation(.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpeed())
                                .delay(randomDelay())) {
                                isAnimating = true
                            }
                        }
                }
            }
            .drawingGroup()
        }
    }
}

#Preview {
    MotionAnimationView()
}

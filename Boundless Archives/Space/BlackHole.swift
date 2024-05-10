//
//  BlackHole.swift
//  Boundless 
//
//  Created by Bassil Taylor on 5/9/24.
//

import Foundation
import SwiftUI

struct BlackHoleBackground: View {
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 0.8
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            ForEach(0..<50) { _ in
                Star(corners: 5, smoothness: 0.45)
                    .foregroundColor(.white.opacity(opacity))
                    .frame(width: 20, height: 20)
                    .offset(x: CGFloat.random(in: -200...200), y: CGFloat.random(in: -200...200))
                    .scaleEffect(scale)
                    .animation(Animation.linear(duration: 5).repeatForever())
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                scale = 2.0
                opacity = 0.1
            }
        }
    }
}

//
//  Stars.swift
//  Boundless 
//
//  Created by Bassil Taylor on 5/9/24.
//

import Foundation
import SwiftUI

struct Star: Shape {
    let corners: Int
    let smoothness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        guard corners >= 2 else { return Path() }
        
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        var currentAngle = -CGFloat.pi / 2
        let angleAdjustment = .pi * 2 / CGFloat(corners * 2)
        
        var path = Path()
        
        path.move(to: CGPoint(x: center.x * (1 + cos(currentAngle) * smoothness),
                              y: center.y * (1 + sin(currentAngle) * smoothness)))
        
        for corner in 0..<corners * 2 {
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottomPoint = CGPoint(x: center.x * (1 + cosAngle * smoothness),
                                      y: center.y * (1 + sinAngle * smoothness))
            let topPoint = CGPoint(x: center.x * (1 + cosAngle),
                                   y: center.y * (1 + sinAngle))
            
            let anchorPoint = CGPoint(x: center.x * (1 + (cosAngle + cos(currentAngle + angleAdjustment)) / 2 * smoothness),
                                      y: center.y * (1 + (sinAngle + sin(currentAngle + angleAdjustment)) / 2 * smoothness))
            
            path.addLine(to: anchorPoint)
            path.addLine(to: bottomPoint)
            
            currentAngle += angleAdjustment
        }
        
        path.closeSubpath()
        
        return path
    }
}

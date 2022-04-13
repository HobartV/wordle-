//
//  shakes.swift
//  WordleVincen
//
//  Created by User14 on 2022/4/10.
//

import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 10
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * cos(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}



//
//  RainParticle.swift
//  RainAnimationNew
//
//  Created by Angelos Staboulis on 2/9/25.
//

import Foundation
struct RainParticle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    var speed: CGFloat
    var length: CGFloat
    var opacity: Double
}

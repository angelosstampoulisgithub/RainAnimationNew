//
//  ContentView.swift
//  RainAnimationNew
//
//  Created by Angelos Staboulis on 2/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var particles: [RainParticle] = []
    let timer = Timer.publish(every: 0.016, on: .main, in: .common).autoconnect() 
    let particleCount = 150
    
    var body: some View {
        GeometryReader { geo in
            Canvas { context, size in
                for particle in particles {
                    var path = Path()
                    path.move(to: CGPoint(x: particle.x, y: particle.y))
                    path.addLine(to: CGPoint(x: particle.x, y: particle.y + particle.length))
                    
                    context.stroke(path, with: .color(Color.white.opacity(particle.opacity)), lineWidth: 1)
                }
            }
            .background(Color.black)
            .onAppear {
                particles = (0..<particleCount).map { _ in
                    createParticle(in: geo.size)
                }
            }
            .onReceive(timer) { _ in
                for index in particles.indices {
                    particles[index].y += particles[index].speed
                    
                    if particles[index].y > geo.size.height {
                        particles[index] = createParticle(in: geo.size)
                        particles[index].y = -particles[index].length
                    }
                }
            }
            
        }
        .ignoresSafeArea()
    }
    func createParticle(in size: CGSize) -> RainParticle {
            RainParticle(
                x: CGFloat.random(in: 0...size.width),
                y: CGFloat.random(in: -size.height...0),
                speed: CGFloat.random(in: 4...10),
                length: CGFloat.random(in: 10...20),
                opacity: Double.random(in: 0.3...0.8)
            )
    }
}

#Preview {
    ContentView()
}

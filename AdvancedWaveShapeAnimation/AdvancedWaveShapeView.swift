//
//  AdvancedWaveShapeView.swift
//  AdvancedWaveShapeAnimation
//
//  Created by Shishir_Mac on 17/11/24.
//

import SwiftUI

struct AdvancedWaveShapeView: View {
    @State private var phase1: CGFloat = 0
    @State private var phase2: CGFloat = 0
    @State private var amplitude: CGFloat = 20
    @State private var frequency: CGFloat = 1.5
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        .ignoresSafeArea()
        .blur(radius: 50)
        
        Circle()
            .fill(Color.clear)
            .frame(width: 300, height: 300)
            .background(
                ZStack {
                    // first wave
                    AdvancedWaveShape(amplitude: amplitude, frequency: frequency, phase: phase1)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.blue, Color.cyan]), startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .opacity(0.7)
                        .onAppear {
                            withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                                phase1 += .pi * 2
                            }
                        }
                    
                    // second
                    AdvancedWaveShape(amplitude: amplitude - 5, frequency: frequency + 0.5, phase: phase2)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.cyan, Color.purple]), startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .opacity(0.5)
                        .onAppear {
                            withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
                                phase2 += .pi * 2
                            }
                        }
                }
            )
            .clipShape(Circle())
            .shadow(color: Color.blue.opacity(0.3), radius: 20, x: 0, y: 10)
    }
        .overlay(
            VStack {
                Text("Adjust Waves")
                    .font(.headline)
                    .foregroundColor(.white)
                HStack {
                    Text("Amplitude")
                    Slider(value: $amplitude, in: 10...100)
                }
                .padding()
                
                HStack {
                    Text("Frequency")
                    Slider(value: $frequency, in: 1...10)
                }
                .padding()
            }
                .padding()
                .background(BlurView(style: .systemUltraThinMaterial))
                .cornerRadius(12)
                .padding()
            , alignment: .bottom
        )
    }
    
}

struct AdvancedWaveShapeView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedWaveShapeView()
    }
}

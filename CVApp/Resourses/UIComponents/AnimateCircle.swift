//
//  AnimateCircle.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct AnimateCircle: View {
    
    @State private var animateStrokeStart = false
    @State private var animateStrokeEnd = true
    @State private var isRotating = false
    
    var body: some View {
        Circle()
            .trim(from: animateStrokeStart ? 1/3 : 1/9, to: animateStrokeEnd ? 2/9 : 1)
            .stroke(lineWidth: 6)
            .frame(width: 50, height: 50)
            .foregroundColor(Color.mainPurpleColor)
            .rotationEffect(.degrees(isRotating ? 360 : 0))
            .onAppear {
                withAnimation(Animation.linear(duration: 0.6).repeatForever(autoreverses: false)) {
                    isRotating.toggle()
                }
                withAnimation(Animation.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                    animateStrokeStart.toggle()
                }
                withAnimation(Animation.linear(duration: 1).delay(0.5).repeatForever(autoreverses: true)) {
                    animateStrokeEnd.toggle()
                }
            }
    }
}

struct AnimateCircle_Previews: PreviewProvider {
    static var previews: some View {
        AnimateCircle()
    }
}

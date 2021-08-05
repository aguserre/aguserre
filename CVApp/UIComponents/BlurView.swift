//
//  BlurView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) { }
}

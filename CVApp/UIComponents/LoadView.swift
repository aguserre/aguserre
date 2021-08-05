//
//  SplashView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 02/08/2021.
//

import SwiftUI

struct LoadView: View {
    
    var body: some View {
        ZStack {
            GeometryReader {reader in
                BlurView(style: .systemUltraThinMaterial)
                    .ignoresSafeArea(.all, edges: .all)
            }
            AnimateCircle()
        }.transition(.opacity)
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        LoadView()
    }
}

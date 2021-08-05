//
//  GradientTranslucentView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct GradientTranslucentView: View {
    var body: some View {
        Rectangle()
            .fill(
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color.systemBackgroundColor.opacity(0.01), location: 0),
                    .init(color: Color.systemBackgroundColor, location: 1)
                ]), startPoint: .top, endPoint: .bottom)
            ).frame(height: 60)
    }
}

struct GradientTranslucentView_Previews: PreviewProvider {
    static var previews: some View {
        GradientTranslucentView()
    }
}

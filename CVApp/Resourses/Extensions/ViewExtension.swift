//
//  ViewExtension.swift
//  CVApp
//
//  Created by Agustin Errecalde on 05/08/2021.
//

import SwiftUI


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}


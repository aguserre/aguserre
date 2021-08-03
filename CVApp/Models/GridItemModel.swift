//
//  GridItemModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI


struct GridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imageString: String
    let url: String
}

struct Column: Identifiable {
    let id = UUID()
    var items = [GridItem]()
}

//
//  ToolBarItemImage.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct ToolBarItemImage: View {
    
    var item: TabBarItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.stringName)
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(Color(UIColor.label))
                .background(
                    Color(UIColor.systemBackground)
                        .cornerRadius(15)
                        .shadow(color: Color(UIColor.systemIndigo), radius: 10)
                )
        }
    }
}

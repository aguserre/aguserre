//
//  ContactView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct ContactView: View {

    let spacing: CGFloat
    let horizontalPadding: CGFloat
    var columns: [Social]

    init(gridItems: [GridItem], numOfColumns: Int, spacing: CGFloat = 10, horizontalPadding: CGFloat = 10) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        var columns = [Social]()
        for _ in 0..<numOfColumns {
            columns.append(Social())
        }
        
        var columnHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        for gridItem in gridItems {
            var smallestColumnIndex = 0
            var smallestHeight = columnHeight.first!
            for i in 1..<columnHeight.count {
                let curHeight = columnHeight[i]
                if curHeight < smallestHeight {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            columns[smallestColumnIndex].socialData.append(gridItem)
            columnHeight[smallestColumnIndex] += gridItem.height
        }
        
        self.columns = columns
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                HStack(alignment: .top, spacing: spacing) {
                    ForEach(columns) { column in
                        LazyVStack(spacing: spacing) {
                            ForEach(column.socialData) {item in
                                getItemView(gridItem: item)
                                    .background(
                                        Color.systemBackgroundColor
                                            .cornerRadius(13)
                                            .shadow(color: Color.mainPurpleColor, radius: 5).opacity(1)
                                    )
                            }
                        }
                        .padding(.top, 20)
                    }
                    
                }
                .padding(.horizontal, horizontalPadding)
                .navigationTitle("Contact me")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        ToolBarItemImage(item: .message)
                    }
                }
            }
        }
    }
}

fileprivate func getItemView(gridItem: GridItem) -> some View {
    ZStack {
        GeometryReader { reader in
            Link(destination: URL(string: gridItem.url)!) {
                Image(uiImage: gridItem.socialImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
            }
        }
    }
    .frame(height: gridItem.height)
    .frame(maxWidth: .infinity)
    .clipShape(RoundedRectangle(cornerRadius: 13))
}


struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(user: User())
        }
        .previewDevice("iPhone 12 Pro")
    }
}

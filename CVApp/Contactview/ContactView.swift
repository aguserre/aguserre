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
    let columns: [Column]

    init(gridItems: [GridItem], numOfColumns: Int, spacing: CGFloat = 10, horizontalPadding: CGFloat = 10) {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        var columns = [Column]()
        for _ in 0..<numOfColumns {
            columns.append(Column())
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
            columns[smallestColumnIndex].items.append(gridItem)
            columnHeight[smallestColumnIndex] += gridItem.height
        }
        
        self.columns = columns
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                HStack(alignment: .top, spacing: spacing) {
                    ForEach(columns) { column in
                        LazyVStack(spacing: spacing) {
                            ForEach(column.items) {item in
                                getItemView(gridItem: item)
                            }
                        }
                    }
                    
                }
                .padding(.horizontal, horizontalPadding)
                .navigationTitle("Contact")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        HStack {
                            Image(systemName: "message")
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
            }
        }
    }
}

fileprivate func getItemView(gridItem: GridItem) -> some View {
    ZStack {
        GeometryReader { reader in
            Link(destination: URL(string: gridItem.url)!) {
                Image(gridItem.imageString)
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


struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(selectedIndex: 4)
        }
        .previewDevice("iPhone 12 Pro")
    }
}

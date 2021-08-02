//
//  ItemWebView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 02/08/2021.
//

import SwiftUI



struct ItemWebView: View {

    var item: GridItem
    
    
    var body: some View {
        Link("Visit Apple", destination: URL(string: "https://www.apple.com")!)
            .font(.title)
            .foregroundColor(.red)
    }
}

struct ItemWebView_Previews: PreviewProvider {
    static var previews: some View {
        ItemWebView(item: GridItem(height: 200, imageString: "facebook", url: "https://www.facebook.com/eagustiin"))
    }
}

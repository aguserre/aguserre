//
//  TitleWithDescriptionView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct TitleWithDescriptionView: View {
    var title: String? = nil
    var subtitle: String? = nil
    var description: String? = nil
    var alignment: HorizontalAlignment = .leading
    
    var body: some View {
        VStack(alignment: alignment) {
            if let title = title {
                Text(title)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Color(UIColor.systemIndigo))
            }
            if let subtitle = subtitle {
                Text(subtitle)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Color(UIColor.systemGray2))
            }
            if let description = description {
                Text(description)
                    .lineLimit(nil)
                    .font(.system(size: 14, weight: .regular, design: .rounded))
                    .padding(.bottom, 5)
            }
            
            Divider()

        }
        .padding([.leading, .trailing], 10)
    }
}

struct TitleWithDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithDescriptionView(title: "Presentacion", subtitle: "asknjksd s" ,description: presentationText)
    }
}

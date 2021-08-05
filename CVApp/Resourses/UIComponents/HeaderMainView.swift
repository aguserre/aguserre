//
//  HeaderMainView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct HeaderMainView: View {
    
    var profileImage: Image?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2 + 50)
                .shadow(color: .black, radius: 4)
            VStack {
                (profileImage ?? Image("defaultImage"))
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2, alignment: .center)
                    .cornerRadius(UIScreen.main.bounds.width/2)
                    .shadow(color: Color.mainPurpleColor, radius: 10)
                
                ZStack {
                    
                    Text("Agustín Errecalde")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold, design: .rounded))
                        .frame(width: UIScreen.main.bounds.width, alignment: .center)
                        .background(
                            Rectangle()
                                .fill(
                                    LinearGradient(colors: [.clear, .black.opacity(0.2),.black.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                                )
                        )
                }
            }
        }
    }
}

struct HeaderMainView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMainView()
    }
}

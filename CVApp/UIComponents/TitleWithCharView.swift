//
//  TitleWithCharView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 01/08/2021.
//

import SwiftUI

struct TitleWithCharView: View {
    var title: String
    var subtitle: String? = nil
    var char: Double
    private let paddingChar: CGFloat = 10
    private let heightChar: CGFloat = 20
    
    @State var animate = false
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            Rectangle().fill(LinearGradient(colors: [.clear, .clear, .clear ,Color.mainPurpleColor,Color.mainPurpleColor], startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10, corners: [.topRight, .bottomRight])
                                
                        )
                        .overlay(
                            Rectangle()
                                .strokeBorder(Color.mainPurpleColor, lineWidth: 2)
                                .cornerRadius(10, corners: [.topRight, .bottomRight])
                            
                        )
                        .frame(width: animate ? char.widthPercentage : 0, height: heightChar)
                        .onAppear {
                            withAnimation(.spring().delay(0.3)) {
                                animate.toggle()
                            }
                        }
                    HStack {
                        Text(title)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .minimumScaleFactor(0.01)
                            .foregroundColor(Color.labelColor)
                            .padding(.leading, paddingChar)
                        Spacer()
                        Text(char.percentStyle)
                            .multilineTextAlignment(.trailing)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.leading, paddingChar)
                    }.frame(width: char.widthPercentage - paddingChar, height: heightChar)

                }
                Spacer()
                
            }
            .padding(.top, 10)
            .frame(width: UIScreen.main.bounds.width, height: 30)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .frame(width: UIScreen.main.bounds.width*0.95, alignment: .leading)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Color.secondaryLabelColor)
            }
        }
        
    }
}



struct TitleWithCharViewView_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithCharView(title: "Swift 5",subtitle: "saifdhbd", char: 0.65)
    }
}

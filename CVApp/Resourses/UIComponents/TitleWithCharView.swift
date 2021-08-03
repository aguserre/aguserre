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
    
    @State var animate = false
    
    var body: some View {
        VStack {
            HStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous).fill(LinearGradient(colors: [.clear, .clear, .clear ,Color(UIColor.systemIndigo),Color(UIColor.systemIndigo)], startPoint: .leading, endPoint: .trailing))
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .strokeBorder(Color(UIColor.systemIndigo), lineWidth: 2)
                        )
                        .frame(width: animate ? char.widthPercentage : 0, height: 20)
                        .onAppear {
                            withAnimation(.spring()) {
                                animate.toggle()
                            }
                        }
                    HStack {
                        Text(title)
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .minimumScaleFactor(0.01)
                            .foregroundColor(Color(UIColor.label))
                            .padding(.leading, 10)
                        Spacer()
                        Text(char.percentStyle)
                            .multilineTextAlignment(.trailing)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.leading, 10)
                    }.frame(width: char.widthPercentage - 10, height: 20)

                }
                Spacer()
                
            }
            .padding(.top, 10)
            .frame(width: UIScreen.main.bounds.width, height: 30)
            
            if let subtitle = subtitle {
                Text(subtitle)
                    .frame(width: UIScreen.main.bounds.width*0.95, alignment: .leading)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
        }
        
    }
}



struct TitleWithCharViewView_Previews: PreviewProvider {
    static var previews: some View {
        TitleWithCharView(title: "Swift 5",subtitle: "saifdhbd", char: 0.65)
    }
}

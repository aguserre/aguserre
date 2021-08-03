//
//  PersonalView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//
import SwiftUI

struct PersonalView: View {
    
    @State var scrollViewIsShowing = false
    var height: CGFloat {
        scrollViewIsShowing ? 20 : 40
    }
    var width: CGFloat {
        scrollViewIsShowing ? 20 : UIScreen.main.bounds.width*0.6
    }

    var body: some View {
            VStack {
                HeaderMainView()
                
                if !scrollViewIsShowing {
                    TitleWithDescriptionView(title: "Presentacion", description: presentationText)
                }
                
                HStack {
                    if scrollViewIsShowing {
                        Spacer()
                    }
                    Button {
                        withAnimation(.spring()) {
                            self.scrollViewIsShowing.toggle()
                        }
                        
                    } label: {
                        Text(scrollViewIsShowing ? "X" : "Ver mas sobre mí")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(scrollViewIsShowing ? .red : Color(UIColor.systemIndigo))
                    }
                    .frame(width: width, height: height, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: scrollViewIsShowing ? 10 : 20)
                            .stroke(scrollViewIsShowing ? .red : Color(UIColor.systemIndigo), lineWidth: 1)
                    )
                }
                .padding([.leading, .trailing, .top], 20)
                .frame(width: UIScreen.main.bounds.width)
                
                Spacer()
                
                if scrollViewIsShowing {
                    ScrollView(.vertical) {
                        ForEach(personal.data, id: \.self) { data in
                            TitleWithDescriptionView(title: data.title, subtitle: data.description, alignment: .center)
                        }
                    }
                    .transition(.opacity)
                    .zIndex(1)
                }
            }

    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
        }
        .previewDevice("iPhone 12 Pro")
    }
}

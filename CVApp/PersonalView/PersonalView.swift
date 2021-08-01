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
                ZStack(alignment: .bottom) {
                    Image("backgroundImage")
                        .resizable()
                        .ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width/2 + 50)
                        .shadow(color: .black, radius: 4)
                    VStack {
                        Image("focusin")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2, alignment: .center)
                            .cornerRadius(UIScreen.main.bounds.width/2)
                            .shadow(color: Color(UIColor.systemIndigo), radius: 10)
                        
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

struct Personal {
    let data: [PersonalData]
}
struct PersonalData: Hashable {
    let title: String
    let description: String
}

fileprivate let personal = Personal(data: personalData)
fileprivate let personalData = [PersonalData(title: "Edad",
                                           description: "31"),
                                PersonalData(title: "Nacionalidad",
                                           description: "Argentino"),
                                PersonalData(title: "Localidad",
                                           description: "Bragado, Buenos Aires, Argentina (CP.6640)"),
                                PersonalData(title: "Correo Electronico",
                                           description: "eagustiin@gmail.com"),
                                PersonalData(title: "Fecha de nacimiento",
                                           description: "21/12/1989"),
                                PersonalData(title: "Estado Civil",
                                           description: "Soltero"),
                                PersonalData(title: "Permiso de conducir",
                                           description: "B")
]

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView()
        }
        .previewDevice("iPhone 12 Pro")
    }
}

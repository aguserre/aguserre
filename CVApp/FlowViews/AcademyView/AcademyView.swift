//
//  AcademyView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI
import DYPopoverView

struct AcademyView: View {
    
    var userAcademy: Academy?
    @State private var isShowingState = false
    @State private var dataSelected: AcademyData = AcademyData(title: "", description: "", status: .completed)

    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(userAcademy?.academyData ?? academyFake.academyData, id: \.self) { data in
                        HStack {
                            TitleWithDescriptionView(title: data.title, subtitle: data.subtitle, description: data.description)
                            data.status.image
                                .anchorView(viewId: "\(data.id)")
                                .onTapGesture(perform: {
                                    dataSelected = data
                                    isShowingState.toggle()
                                })
                                .foregroundColor(Color(UIColor.label))
                                .font(.system(size: 18, weight : .bold, design: .default ))
                                .frame(width: 26, height: 26, alignment: .center)
                                .background(
                                    data.status.iconColor.opacity(0.5)
                                        .cornerRadius(13)
                                        .shadow(color: data.status.iconColor, radius: 5)
                                )
                            Spacer()
                        }
                    }
                }
            }
            .navigationTitle("Academy")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    ToolBarItemImage(item: .graduationcap)
                }
            }

        }
        .popoverView(content: {
            HStack {
                dataSelected.status.image
                    .font(.system(size: 18, weight : .bold, design: .default ))
                    .frame(width: 26, height: 26, alignment: .center)
                Text(dataSelected.status.rawValue)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Color(UIColor.label))
            }
            
        }, background: {
            dataSelected.status.iconColor
                .shadow(color: Color(UIColor.label), radius: 5)
                .onTapGesture {
                isShowingState.toggle()
            }
        }, isPresented: $isShowingState,
                     frame: .constant(CGRect(x: 0, y: 0, width: 150, height: 50)),
                     anchorFrame: nil,
                     popoverType: .popout,
                     position: .left,
                     viewId: dataSelected.id,
                     settings: DYPopoverViewSettings(shadowRadius: 20)
        )
    }
}


struct AcademyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(user: User())
        }
        .previewDevice("iPhone 12 Pro")
    }
}

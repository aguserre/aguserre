//
//  AcademyView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI
import DYPopoverView

struct AcademyView: View {
    
    @State private var isShowingState = false
    @State private var dataSelected: AcademyData = AcademyData(title: "", description: "", status: .completed)

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(academy.data, id: \.self) { data in
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
                    HStack {
                        Image(systemName: "graduationcap")
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

struct Academy {
    let data: [AcademyData]
}
struct AcademyData: Hashable {
    let id = UUID().uuidString
    let title: String
    var subtitle: String? = nil
    let description: String
    let status: Status
}

enum Status {
    case completed, onCurse, paused, abandoned
    
    var rawValue: String {
        switch self {
        case .completed:
            return "Completado"
        case .onCurse:
            return "En curso"
        case .paused:
            return "Pausado"
        case .abandoned:
            return "Abandonado"
        }
    }
    
    var image: Image {
        switch self {
        case .completed:
            return Image(systemName: "checkmark")
        case .onCurse:
            return Image(systemName: "bandage")
        case .abandoned:
            return Image(systemName: "trash")
        case .paused:
            return Image(systemName: "hand.raised")
        }
    }
    
    var iconColor: Color {
        switch self {
        case .completed:
            return Color(UIColor.systemGreen)
        case .onCurse:
            return Color(UIColor.systemBlue)
        case .abandoned:
            return Color(UIColor.systemRed)
        case .paused:
            return Color(UIColor.systemYellow)
        }
    }
}

fileprivate let academy = Academy(data: academyData)
fileprivate let academyData = [AcademyData(title: "Analista de Sistemas",
                                           subtitle: "Mar 2017 - Actualidad",
                                           description: "ESBA, Capital Federal, Buenos Aires.\nEstudiante de Analista de Sistemas. Instituto ESBA, sede Barrio Norte. Capital Federal. 30/36 materias aprobadas.", status: .onCurse),
                               AcademyData(title: "Bachiller Ciencias Naturales",
                                           subtitle: "Dic 2007",
                                           description: "Escuela Normal Media Numero 41, Bragado, Buenos Aires, Argentina.", status: .completed),
                               AcademyData(title: "Diseñador de páginas web",
                                           subtitle: "Mar 2008 - Dic 2008",
                                           description: "Sistemas y Capacitacion S.R.L., Bragado, Buenos Aires, Argentina.", status: .paused),
                               AcademyData(title: "Curso avanzado de Auditoría Interna",
                                           subtitle: "Jul 2016",
                                           description: "BDO, Capital Federal, Buenos Aires.", status: .completed),
                               AcademyData(title: "Curso avanzado de software IDEA",
                                           subtitle: "Ago 2016",
                                           description: "BDO, Capital Federal, Buenos Aires.", status: .completed),
                               AcademyData(title: "Curso avanzado de Programación SQL",
                                           subtitle: "Jul 2017",
                                           description: "Educación IT, Capital Federal, Buenos Aires.", status: .abandoned),
                               AcademyData(title: "Desarrollador iOS",
                                           subtitle: "Mar 2019 - Sep 2019",
                                           description: "Digital House, Capital Federal, Buenos Aires.", status: .completed),
                               AcademyData(title: "Curso TDD",
                                           subtitle: "Mar 2021 - Abr 2021",
                                           description: "10Pines, Capital Federal", status: .completed)
]

struct AcademyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(selectedIndex: 1)
        }
        .previewDevice("iPhone 12 Pro")
    }
}

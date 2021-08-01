//
//  AcademyView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct AcademyView: View {

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(academy.data, id: \.self) { data in
                        TitleWithDescriptionView(title: data.title, subtitle: data.subtitle, description: data.description)
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
    }
}

struct Academy {
    let data: [AcademyData]
}
struct AcademyData: Hashable {
    let title: String
    var subtitle: String? = nil
    let description: String
}

fileprivate let academy = Academy(data: academyData)
fileprivate let academyData = [AcademyData(title: "Analista de Sistemas",
                                           subtitle: "Mar 2017 - Actualidad",
                                           description: "ESBA, Capital Federal, Buenos Aires.\nEstudiante de Analista de Sistemas. Instituto ESBA, sede Barrio Norte. Capital Federal. 30/36 materias aprobadas."),
                               AcademyData(title: "Bachiller Ciencias Naturales",
                                           subtitle: "Dic 2007",
                                           description: "Escuela Normal Media Numero 41, Bragado, Buenos Aires, Argentina."),
                               AcademyData(title: "Diseñador de páginas web",
                                           subtitle: "Mar 2008 - Dic 2008",
                                           description: "Sistemas y Capacitacion S.R.L., Bragado, Buenos Aires, Argentina."),
                               AcademyData(title: "Curso avanzado de Auditoría Interna",
                                           subtitle: "Jul 2016",
                                           description: "BDO, Capital Federal, Buenos Aires."),
                               AcademyData(title: "Curso avanzado de software IDEA",
                                           subtitle: "Ago 2016",
                                           description: "BDO, Capital Federal, Buenos Aires."),
                               AcademyData(title: "Curso avanzado de Programación SQL",
                                           subtitle: "Jul 2017",
                                           description: "Educación IT, Capital Federal, Buenos Aires."),
                               AcademyData(title: "Desarrollador iOS",
                                           subtitle: "Mar 2019 - Sep 2019",
                                           description: "Digital House, Capital Federal, Buenos Aires."),
                               AcademyData(title: "Curso TDD",
                                           subtitle: "Mar 2021 - Abr 2021",
                                           description: "10Pines, Capital Federal")
]

struct AcademyView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(selectedIndex: 1)
        }
        .previewDevice("iPhone 12 Pro")
    }
}

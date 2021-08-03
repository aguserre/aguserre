//
//  AcademyModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct Academy {
    let data: [AcademyData]
}
struct AcademyData: Hashable {
    let id = UUID().uuidString
    let title: String
    var subtitle: String? = nil
    let description: String
    let status: AcademyStatus
}

enum AcademyStatus {
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

let academy = Academy(data: academyData)
let academyData = [AcademyData(title: "Analista de Sistemas",
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

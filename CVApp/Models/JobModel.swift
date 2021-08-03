//
//  JobModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI


struct Experience {
    let data: [Job]
}

struct Job: Identifiable {
    let id = UUID()
    let type: JobType
    let name: String
    let position: String
    let dateStart: String
    let dateEnd: String
    let description: String
}

enum JobType: String {
    case auditor = "Auditor de Sistemas", developer = "Developer", other = "Otros"
}

let experience = Experience(data: jobs)
let jobs = [Job(type: .other, name: "GoodPeople", position: "Vendedor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .auditor, name: "Bertora", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .auditor, name: "BDO", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .auditor, name: "Tarshop", position: "Auditor", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .developer, name: "Gob. Ciudad", position: "iOS Dev", dateStart: "dsafas", dateEnd: "safjnakd", description: "jfdsdsigvojsdfl"),
            Job(type: .developer, name: "FluxIt", position: "iOS Dev", dateStart: "dsafas", dateEnd: "safjnakd", description: "iahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaegosjgdknfgbahkdnfloigjwlnksghawbglkjawgg waeuigju ghairuwh uiarh uiahu huhguha gruiai hiaeg")]

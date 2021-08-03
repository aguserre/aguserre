//
//  PersonalDataModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//
import SwiftUI

struct Personal {
    let data: [PersonalData]
}
struct PersonalData: Hashable {
    let title: String
    let description: String
}

let personal = Personal(data: personalData)
let personalData = [PersonalData(title: "Edad",
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

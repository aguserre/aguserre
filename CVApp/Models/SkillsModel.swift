//
//  SkillsModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct Skills {
    let data: [SkillsData]
}

struct SkillsData: Hashable {
    let name: String
    let subtitle: String
    let percent: Double
}

let skills = Skills(data: skillsData)
let skillsData = [SkillsData(name: "Microsoft Office", subtitle: "Excel, Word, Access, PowerPoint, Outlook", percent: 0.80),
                  SkillsData(name: "Bases de datos", subtitle: "SQL, Access, Mongo",percent: 0.55),
                  SkillsData(name: "Herramientas gráficas", subtitle: "Photoshop",percent: 0.45),
                  SkillsData(name: "Software de Auditoria", subtitle: "IDEA, ACL",percent: 0.80),
                  SkillsData(name: "Lenguajes de programación", subtitle: "Swift, Objective-C, SwiftUI",percent: 0.90),
                  SkillsData(name: "API Testing", subtitle: "Postman",percent: 0.95),
                  SkillsData(name: "Software de gestión", subtitle: "Jira, Trello",percent: 0.80),
                  SkillsData(name: "Repositorios", subtitle: "Gitlab, Github, Bitbucket",percent: 0.90)]

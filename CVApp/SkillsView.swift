//
//  SkillsView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct SkillsView: View {

    var body: some View {

        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(skills.data, id: \.self) { skill in
                        TitleWithCharView(title: skill.name, subtitle: skill.subtitle, char: skill.percent)
                    }
                }
                .navigationTitle("Skills")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        HStack {
                            Image(systemName: "cpu")
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
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(selectedIndex: 2)
        }
        .previewDevice("iPhone 12 Pro")
    }
}

struct Skills {
    let data: [SkillsData]
}
struct SkillsData: Hashable {
    let name: String
    let subtitle: String
    let percent: Double
}

fileprivate let skills = Skills(data: skillsData)
fileprivate let skillsData = [SkillsData(name: "Microsoft Office", subtitle: "Excel, Word, Access, PowerPoint, Outlook", percent: 0.80),
                              SkillsData(name: "Bases de datos", subtitle: "SQL, Access, Mongo",percent: 0.55),
                              SkillsData(name: "Herramientas gráficas", subtitle: "Photoshop",percent: 0.45),
                              SkillsData(name: "Software de Auditoria", subtitle: "IDEA, ACL",percent: 0.80),
                              SkillsData(name: "Lenguajes de programación", subtitle: "Swift, Objective-C, SwiftUI",percent: 0.90),
                              SkillsData(name: "API Testing", subtitle: "Postman",percent: 0.95),
                              SkillsData(name: "Software de gestión", subtitle: "Jira, Trello",percent: 0.80),
                              SkillsData(name: "Repositorios", subtitle: "Gitlab, Github, Bitbucket",percent: 0.90)]

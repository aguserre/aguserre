//
//  SkillsView.swift
//  CVApp
//
//  Created by Agustin Errecalde on 30/07/2021.
//

import SwiftUI

struct SkillsView: View {
 
    var skills: Skills?
    
    var body: some View {

        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(skills?.skillsData ?? skillsFake.skillsData, id: \.self) { skill in
                        TitleWithCharView(title: skill.name, subtitle: skill.subtitle, char: skill.percent)
                    }
                }
                .navigationTitle("Skills")
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        ToolBarItemImage(item: .cpu)
                    }
                }
            }

        }
    }
}

struct SkillsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarView(user: User())
        }
        .previewDevice("iPhone 12 Pro")
    }
}


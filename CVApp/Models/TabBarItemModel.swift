//
//  TabBarItem.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//
import SwiftUI


enum TabBarItemModel: Int {
    case person, graduationcap, cpu, latch, message
    
    var stringName: String {
        switch self {
        case .person:
            return "person"
        case .graduationcap:
            return "graduationcap"
        case .cpu:
            return "cpu"
        case .latch:
            return "latch.2.case"
        case .message:
            return "message"
        }
    }
    
    func viewToShow(user: User) -> some View {
        ZStack {
            switch self {
            case .person:
                PersonalView(personalData: user.personal)
            case .graduationcap:
                AcademyView(userAcademy: user.academy)
            case .cpu:
                SkillsView(skills: user.skills)
            case .latch:
                ExperienceView(experience: user.jobs)
            case .message:
                ContactView(gridItems: user.social?.socialData ?? gridItemsFake, numOfColumns: 2)
            }
        }
    }
    
    static var allItems = [person, graduationcap, cpu, latch, message]
}



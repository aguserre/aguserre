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
    
    var viewToShow: some View {
        ZStack {
            switch self {
            case .person:
                PersonalView()
            case .graduationcap:
                AcademyView()
            case .cpu:
                SkillsView()
            case .latch:
                ExperienceView()
            case .message:
                ContactView(gridItems: gridItems, numOfColumns: 2)
            }
        }
    }
    
    static var allItems = [person, graduationcap, cpu, latch, message]
}

fileprivate let gridItems = [GridItem(height: 200, imageString: "github", url: "https://github.com/aguserre"),
                             GridItem(height: 140, imageString: "linkedin", url: "https://www.linkedin.com/in/agustin-errecalde-a853b767/"),
                             GridItem(height: 110, imageString: "instagram", url: "https://www.instagram.com/agustinerrecalde/"),
                             GridItem(height: 120, imageString: "telegram", url: "tg://resolve?domain=@agustinerre"),
                             GridItem(height: 200, imageString: "whatsapp", url: "https://api.whatsapp.com/send?phone=+5492342514756"),
                             GridItem(height: 150, imageString: "mail", url: "mailto:eagustiin@gmail.com"),
                             GridItem(height: 100, imageString: "facebook", url: "https://www.facebook.com/eagustiin"),
                             GridItem(height: 150, imageString: "twitter", url: "https://twitter.com/eagustiin")]

//
//  AcademyModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct Academy {
    let academyData: [AcademyData]
}
extension Academy: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case academyData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.academyData = try container.decode([AcademyData].self, forKey: .academyData)
    }
}

struct AcademyData: Hashable {
    let id = UUID().uuidString
    let title: String
    var subtitle: String?
    let description: String
    let status: AcademyStatus
}

extension AcademyData: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case title, subtitle, description, status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.subtitle = try container.decodeIfPresent(String.self, forKey: .subtitle)
        self.description = try container.decode(String.self, forKey: .description)
        let statusFromAPI = try container.decode(String.self, forKey: .status)
        self.status = AcademyStatus(rawValue: statusFromAPI) ?? .completed
    }
}

enum AcademyStatus: String, Codable {
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

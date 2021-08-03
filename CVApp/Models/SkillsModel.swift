//
//  SkillsModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct Skills {
    let skillsData: [SkillsData]
}
extension Skills: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case skillsData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.skillsData = try container.decode([SkillsData].self, forKey: .skillsData)
    }
}

struct SkillsData: Hashable {
    let name: String
    let subtitle: String
    let percent: Double
}
extension SkillsData: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case name, subtitle, percent
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try container.decode(String.self, forKey: .name)
        self.subtitle = try container.decode(String.self, forKey: .subtitle)
        self.percent = try container.decode(Double.self, forKey: .percent)
    }
}

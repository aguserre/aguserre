//
//  PersonalDataModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//
import SwiftUI

struct Personal {
    var profileImage: Image = Image("defaultImage")
    let aboutMe: String
    let personalData: [PersonalData]
}
struct PersonalData: Hashable {
    let title: String
    let description: String
}

extension PersonalData: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case title, description

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
    }
}

extension Personal: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case aboutMe, personalData

    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.aboutMe = try container.decode(String.self, forKey: .aboutMe)
        self.personalData = try container.decode([PersonalData].self, forKey: .personalData)
    }
}

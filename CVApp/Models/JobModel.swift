//
//  JobModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI


struct JobExperience {
    let jobsData: [Job]
}
extension JobExperience: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case jobsData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.jobsData = try container.decode([Job].self, forKey: .jobsData)
    }
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
extension Job: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case id, type, name, position, dateStart, dateEnd, description
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        self.type = JobType(rawValue: type) ?? .other
        self.name = try container.decode(String.self, forKey: .name)
        self.position = try container.decode(String.self, forKey: .position)
        let dateStart = try container.decode(String.self, forKey: .dateStart)
        self.dateStart = dateStart.convertToShortDate() ?? dateStart
        let dateEnd = try container.decode(String.self, forKey: .dateEnd)
        self.dateEnd = dateEnd.convertToShortDate() ?? dateEnd
        self.description = try container.decode(String.self, forKey: .description)

    }
}

enum JobType: String, Codable {
    case auditor = "Auditor", developer = "Developer", other = "Otros"
}

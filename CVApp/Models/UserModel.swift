//
//  UserModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct User {
    var personal: Personal?
    let jobs: JobExperience?
    let academy: Academy?
    let skills: Skills?
    var social: Social?
    
    var socialImages = [UIImage]()
}

extension User: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case personal, jobs, academy, skills, social
    }
    
    init() {
        personal = nil
        jobs = nil
        academy = nil
        skills = nil
        social = nil
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.personal = try container.decodeIfPresent(Personal.self, forKey: .personal)
        self.jobs = try container.decodeIfPresent(JobExperience.self, forKey: .jobs)
        self.academy = try container.decodeIfPresent(Academy.self, forKey: .academy)
        self.skills = try container.decodeIfPresent(Skills.self, forKey: .skills)
        self.social = try container.decodeIfPresent(Social.self, forKey: .social)
    }
    
    func isEmptyUser() -> Bool {
        return personal == nil && jobs == nil && academy == nil && skills == nil && social == nil
    }
}

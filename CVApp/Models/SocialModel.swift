//
//  SocialModel.swift
//  CVApp
//
//  Created by Agustin Errecalde on 03/08/2021.
//

import SwiftUI

struct Social: Identifiable  {
    let id = UUID()
    var socialData: [GridItem]
}

extension Social: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case socialData
    }
    
    init() {
        self.socialData = []
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.socialData = try container.decode([GridItem].self, forKey: .socialData)
    }
}

struct GridItem: Identifiable {
    let id = UUID()
    let height: CGFloat
    let imageString: String
    let url: String
}
extension GridItem: Decodable, Encodable {
    enum CodingKeys: String, CodingKey {
        case height, imageString, url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.height = try container.decode(CGFloat.self, forKey: .height)
        self.imageString = try container.decode(String.self, forKey: .imageString)
        self.url = try container.decode(String.self, forKey: .url)
    }
}

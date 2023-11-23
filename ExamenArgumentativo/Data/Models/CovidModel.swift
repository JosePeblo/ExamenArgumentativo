//
//  CovidResponse.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

struct CovidCase: Codable {
    var total: Int
    var new: Int
}

struct CovidResponse: Codable, Identifiable {
    
    var id = UUID()
    var country: String
    var region: String
    var cases: [String: CovidCase]
    
    enum CodingKeys: String, CodingKey {
        case country, region, cases
    }
}



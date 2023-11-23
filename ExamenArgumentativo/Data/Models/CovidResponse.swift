//
//  CovidResponse.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

struct CovidResponse: Codable, Identifiable {
    struct CovidCase: Codable {
        var total: Int
        var new: Int
    }
    var id = UUID()
    var country: String
    var region: String
    var cases: [String: CovidCase]
    
    enum CodingKeys: String, CodingKey {
        case country, region, cases
    }
}



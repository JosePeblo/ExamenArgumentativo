//
//  CovidResponse.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

struct CovidResponse: Codable {
    struct CovidCase: Codable {
        var total: Int
        var new: Int
    }
    var country: String
    var region: String
    var cases: [String: CovidCase]
}



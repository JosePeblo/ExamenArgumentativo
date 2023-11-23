//
//  CovidApi.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

struct CovidApi {
    static let base = "https://api.api-ninjas.com/v1/covid19"
    
}

protocol CaseProtocol {
    func getCases(country: String) async -> [CovidResponse]?
}

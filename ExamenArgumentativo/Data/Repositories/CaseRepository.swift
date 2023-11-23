//
//  CovidRepository.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

class CaseRepository: CaseProtocol {
    let netService: NetworkApiService
    static let shared = CaseRepository()
    
    init(netService: NetworkApiService = NetworkApiService.shared) {
        self.netService = netService
    }
    
    func getCases(country: String) async -> [CovidResponse]? {
        let params = [
            "country": country
        ]
        return await netService.get(url: URL(string: "\(CovidApi.base)")!, params: params)
    }
    
    
}

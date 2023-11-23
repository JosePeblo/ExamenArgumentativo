//
//  CaseListRequirement.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

protocol CaseListRequirementProtocol {
    func getCases(country: String) async -> [CovidResponse]?
}

class CaseListRequirement: CaseListRequirementProtocol {
    let dataRepo: CaseRepository
    static let shared = CaseListRequirement()
    
    init(dataRepo: CaseRepository = CaseRepository.shared) {
        self.dataRepo = dataRepo
    }
    
    func getCases(country: String) async -> [CovidResponse]? {
        return await dataRepo.getCases(country: country)
    }
}

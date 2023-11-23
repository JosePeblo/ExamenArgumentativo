//
//  CaseListViewModel.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

class CaseListViewModel: ObservableObject {
    @Published var caseList = [CovidResponse]()
    
    var caseListRequirement: CaseListRequirement
    
    init(caseListRequirement: CaseListRequirement = CaseListRequirement.shared) {
        self.caseListRequirement = caseListRequirement
    }
    
    func getCases(country: String) async {
        self.caseList = await self.caseListRequirement.getCases(country: country) ?? []
        print(self.caseList)
    }
    
}

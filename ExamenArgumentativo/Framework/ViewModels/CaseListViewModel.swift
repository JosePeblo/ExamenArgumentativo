//
//  CaseListViewModel.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import Foundation

struct InfectionDay {
    var day: Date
    var data: CovidCase
}

class CaseListViewModel: ObservableObject {
    @Published var caseList = [CovidResponse]()
    @Published var country: String
    @Published var worstDay: InfectionDay
    var peakInfections: Int
    
    var caseListRequirement: CaseListRequirement
    
    init(caseListRequirement: CaseListRequirement = CaseListRequirement.shared) {
        self.caseListRequirement = caseListRequirement
        self.country = ""
        self.worstDay = InfectionDay(day: Date(), data: CovidCase(total: 0, new: 0))
        self.peakInfections = 0
        
    }
    
    @MainActor
    func getCases() async {
        self.worstDay = InfectionDay(day: Date(), data: CovidCase(total: 0, new: 0))
        self.peakInfections = 0
        
        self.caseList = await self.caseListRequirement.getCases(country: self.country) ?? []
        
        self.caseList.forEach { elem in
            for day in elem.cases {
                if day.value.total > peakInfections {
                    peakInfections = day.value.total
                    worstDay.data.total =  day.value.total
                    worstDay.data.new = day.value.new
                    worstDay.day = day.key.toISODate()
                }
            }
        }
        
    }
    
}

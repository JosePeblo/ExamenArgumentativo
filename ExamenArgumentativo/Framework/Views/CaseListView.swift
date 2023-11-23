//
//  CaseListView.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import SwiftUI
import Charts

struct CaseListView: View {
    @StateObject var viewModel: CaseListViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Country:")
                TextField("Country", text: $viewModel.country)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    
            }
            
        
            Text("Worst day: \(viewModel.worstDay.day.formatted(date: .complete, time: .omitted))")
            Text("Total cases at peak: \(viewModel.worstDay.data.total)")
            
           
            Button {
                Task {
                    await viewModel.getCases()
                }
            } label: {
                Text("Fetch Data")
            }.buttonStyle(.bordered)

        }.padding(.horizontal, 16)
            .padding(.vertical, 32)
    }
}

struct CaseListViewPreviews: PreviewProvider {
    static var previews: some View {
        CaseListView(viewModel: testViewModel())
    }
    
    static func testViewModel() -> CaseListViewModel {
        let vm = CaseListViewModel()
        vm.caseList = [
            CovidResponse(country: "mexico", region: "", cases: [
                "2020-01-22": CovidCase(total: 0, new: 0),
                "2020-01-23": CovidCase(total: 0, new: 0),
                "2020-01-24": CovidCase(total: 0, new: 0),
                "2020-01-25": CovidCase(total: 0, new: 0),
                "2020-01-26": CovidCase(total: 0, new: 0),
                "2020-01-27": CovidCase(total: 0, new: 0),
                "2020-01-28": CovidCase(total: 0, new: 0),
                "2020-01-29": CovidCase(total: 0, new: 0)
            ])
        ]
        return vm
    }
}


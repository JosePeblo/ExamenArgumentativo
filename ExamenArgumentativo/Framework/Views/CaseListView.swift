//
//  CaseListView.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import SwiftUI

struct CaseListView: View {
    @StateObject var viewModel: CaseListViewModel

    var body: some View {
        List(viewModel.caseList) { elem in
            ForEach(Array(elem.cases.keys), id: \.self) { key in
                Text(key)
                Text("\(elem.cases[key]?.total ?? -1)")
            }
        }
        .onAppear {
            Task {
                await viewModel.getCases(country: "mexico")
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CaseListView(viewModel: CaseListViewModel())
}

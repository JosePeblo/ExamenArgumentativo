//
//  ExamenArgumentativoApp.swift
//  ExamenArgumentativo
//
//  Created by peblo on 23/11/23.
//

import SwiftUI

@main
struct ExamenArgumentativoApp: App {
    var body: some Scene {
        WindowGroup {
            CaseListView(viewModel: CaseListViewModel())
        }
    }
}

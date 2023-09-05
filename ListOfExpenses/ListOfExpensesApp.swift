//
//  ListOfExpensesApp.swift
//  ListOfExpenses
//
//  Created by O'lmasbek on 05/09/23.
//

import SwiftUI

@main
struct ListOfExpensesApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}

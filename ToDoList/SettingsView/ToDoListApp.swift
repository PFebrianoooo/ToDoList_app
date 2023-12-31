//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Putra Pebriano Nurba on 31/12/23.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListRowView()
            }
            .environmentObject(listViewModel)
        }
    }
}

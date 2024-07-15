//
//  NotelyApp.swift
//  Notely
//
//  Created by amin nazemzadeh on 7/11/24.
//

import SwiftData
import SwiftUI

@main
struct NotelyApp: App {
    @State var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            NavigationSplitView(sidebar: SidebarView.init, content: ContentView.init, detail: DetailView.init)
        }
        .modelContainer(dataController.container)
        .environment(dataController)
    }
}

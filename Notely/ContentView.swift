//
//  ContentView.swift
//  Notely
//
//  Created by amin nazemzadeh on 7/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext

    var body: some View {
       Text("Content")
    }
}

#Preview {
    return ContentView()
        .preview()
}

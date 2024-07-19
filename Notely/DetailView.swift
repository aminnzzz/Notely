//
//  DetailView.swift
//  Notely
//
//  Created by amin nazemzadeh on 7/14/24.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    var body: some View {
        Text("Detail")
    }
}

#Preview {
    DetailView()
        .preview()
}

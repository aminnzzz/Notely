//
//  SidebarView.swift
//  Notely
//
//  Created by amin nazemzadeh on 7/14/24.
//

import SwiftData
import SwiftUI

struct SidebarView: View {
    let smartFilters: [Filter] = [.all, .recent]
    @Environment(DataController.self) var dataController

    @Query(sort: \Tag.name, animation: .default) var tags: [Tag]

    var tagFilters: [Filter] {
        tags.map { tag in
            Filter(
                id: tag.id ?? UUID(),
                name: tag.name ?? "No name",
                icon: "tag",
                tag: tag
            )
        }
    }

    var body: some View {
        @Bindable var dataController = dataController

        List(selection: $dataController.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }

            Section("Tags") {
                ForEach(tagFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
        }
        .toolbar {
            Button {
                dataController.deleteAll()
                dataController.createSampleData()
            } label: {
                Label("ADD SAMPLES", systemImage: "flame")
            }
        }
    }
}

#Preview {
    return SidebarView()
        .preview()
}

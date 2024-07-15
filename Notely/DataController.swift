//
//  DataController.swift
//  Notely
//
//  Created by amin nazemzadeh on 7/11/24.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
final class DataController {
    var selectedFilter: Filter? = .all
    var container: ModelContainer

    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        Task { @MainActor in
            dataController.createSampleData()
        }
        return dataController
    }()

    init(inMemory: Bool = false) {
        let schema = Schema([Tag.self, Note.self])

        let config = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: inMemory,
            cloudKitDatabase: .automatic
        )

        do {
            try self.container = ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError()
        }
    }

    @MainActor
    func createSampleData() {
        for i in 1...5 {
            var notes: [Note] = []

            for j in 1...10 {
                let note = Note(
                    title: "Note \(i)-\(j)",
                    text: "Note text",
                    creationDate: .now,
                    modificationData: .now
                )

                notes.append(note)
            }

            let tag = Tag(name: "Tag \(i)", notes: notes)
            container.mainContext.insert(tag)
        }

        try? container.mainContext.save()
    }

    @MainActor
    func save() {
        if container.mainContext.hasChanges {
            try? container.mainContext.save()
        }
    }

    @MainActor
    func delete(_ object: any PersistentModel) {
        container.mainContext.delete(object)
        save()
    }
    
    @MainActor
    func deleteAll() {
        do {
            try container.mainContext.delete(model: Tag.self)
            try container.mainContext.delete(model: Note.self)
        } catch {
            print("Failed to delete all models: \(error.localizedDescription)")
        }
    }
}

extension View {
    public func preview() -> some View {
        self
            .environment(DataController.preview)
            .modelContainer(DataController.preview.container)
    }
}

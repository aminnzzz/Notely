//
//  Note.swift
//  Notely
//
//  Created by amin nazemzadeh on 7/11/24.
//

import Foundation
import SwiftData

@Model
class Note {
    @Attribute(.spotlight) var title: String?
    var text: String?
    var creationDate: Date?
    var modificationData: Date?
    @Relationship(inverse: \Tag.notes) var tags: [Tag]?

    init(
        title: String = "Title",
        text: String = "Text goes here...",
        creationDate: Date = .now,
        modificationData: Date = .now,
        tags: [Tag] = []
    ) {
        self.title = title
        self.text = text
        self.creationDate = creationDate
        self.modificationData = modificationData
        self.tags = tags
    }

    func update<T>(keyPath: ReferenceWritableKeyPath<Note, T>, to value: T) {
        self[keyPath: keyPath] = value
        modificationData = .now
    }
}

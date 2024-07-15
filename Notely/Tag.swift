//
//  Tag.swift
//  Notely
//
//  Created by amin nazemzadeh on 7/11/24.
//

import Foundation
import SwiftData

@Model
class Tag {
    var id: UUID?
    var name: String?
    var notes: [Note]?

    init(
        id: UUID = UUID(),
        name: String = "Tag",
        notes: [Note] = []
    ) {
        self.id = id
        self.name = name
        self.notes = notes
    }
}

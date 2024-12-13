//
//  NoteViewModel.swift
//  CatchIt
//
//  Created by Giano on 13/12/24.
//

import SwiftUI

struct Note: Identifiable, Codable {
    let id: UUID
    var content: String
    var date: Date

    init(content: String, date: Date = Date()) {
        self.id = UUID()
        self.content = content
        self.date = date
    }
}

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []

    func add(note: Note) {
        notes.append(note)
    }

    func update(note: Note, at index: Int) {
        notes[index] = note
    }
}

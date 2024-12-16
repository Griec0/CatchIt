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

struct Folder: Identifiable, Codable {
    let id: UUID
    var name: String
    var notes: [Note]

    init(name: String, notes: [Note] = []) {
        self.id = UUID()
        self.name = name
        self.notes = notes
    }
}

class NotesViewModel: ObservableObject {
    @Published var folders: [Folder] = [] {
        didSet {
            saveFolders()
        }
    }

    init() {
        loadFolders()
    }

    private let foldersKey = "savedFolders"

    func addFolder(folder: Folder) {
        folders.append(folder)
    }

    func add(note: Note, to folderIndex: Int) {
        folders[folderIndex].notes.append(note)
    }

    func update(note: Note, in folderIndex: Int, at noteIndex: Int) {
        folders[folderIndex].notes[noteIndex] = note
    }

    private func saveFolders() {
        if let encoded = try? JSONEncoder().encode(folders) {
            UserDefaults.standard.set(encoded, forKey: foldersKey)
        }
    }

    private func loadFolders() {
        if let data = UserDefaults.standard.data(forKey: foldersKey),
           let decoded = try? JSONDecoder().decode([Folder].self, from: data) {
            folders = decoded
        }
    }
}

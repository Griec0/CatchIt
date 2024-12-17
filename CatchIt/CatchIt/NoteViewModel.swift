//
//  NoteViewModel.swift
//  CatchIt
//
//  Created by Giano on 13/12/24.
//

import SwiftUI

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

    func delete(noteAt noteIndex: Int, in folderIndex: Int) {
        folders[folderIndex].notes.remove(at: noteIndex)
    }

    func deleteFolder(at folderIndex: Int) {
        folders.remove(at: folderIndex)
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

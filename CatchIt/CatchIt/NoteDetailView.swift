//
//  NoteDetailView.swift
//  CatchIt
//
//  Created by Giano on 16/12/24.
//

import SwiftUI

struct NoteDetailView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    
    let folderIndex: Int
    let noteIndex: Int?

    @State private var title: String
    @State private var content: String

    @Environment(\ .presentationMode) var presentationMode

    init(viewModel: NotesViewModel, folderIndex: Int, noteIndex: Int? = nil) {
        self.viewModel = viewModel
        self.folderIndex = folderIndex
        self.noteIndex = noteIndex

        if let noteIndex = noteIndex {
            let note = viewModel.folders[folderIndex].notes[noteIndex]
            _title = State(initialValue: note.title)
            _content = State(initialValue: note.content)
        } else {
            _title = State(initialValue: "")
            _content = State(initialValue: "")
        }
    }

    var body: some View {
        Form {
            TextField("Titolo", text: $title)
                .font(.headline)
            TextEditor(text: $content)
                .frame(minHeight: 200)
        }
        .navigationBarTitle(noteIndex == nil ? "Nuova Nota" : "Modifica Nota", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Salva") {
                    let newNote = Note(title: title, content: content)
                    if let noteIndex = noteIndex {
                        viewModel.update(note: newNote, in: folderIndex, at: noteIndex)
                    } else {
                        viewModel.add(note: newNote, to: folderIndex)
                    }
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

//
//  AddNoteView.swift
//  CatchIt
//
//  Created by Giano on 13/12/24.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\ .presentationMode) var presentationMode
    @ObservedObject var viewModel: NotesViewModel
    @State private var content: String = ""
    let folderIndex: Int
    var noteToEdit: Note? = nil
    var noteIndex: Int? = nil

    init(viewModel: NotesViewModel, folderIndex: Int, noteToEdit: Note? = nil, noteIndex: Int? = nil) {
        self.viewModel = viewModel
        self.folderIndex = folderIndex
        self.noteToEdit = noteToEdit
        self.noteIndex = noteIndex
        _content = State(initialValue: noteToEdit?.content ?? "")
    }

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $content)
                    .padding()
                    .navigationTitle(noteToEdit == nil ? "Nuova Nota" : "Modifica Nota")
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salva") {
                        if let noteToEdit = noteToEdit, let index = noteIndex {
                            var updatedNote = noteToEdit
                            updatedNote.content = content
                            updatedNote.date = Date()
                            viewModel.update(note: updatedNote, in: folderIndex, at: index)
                        } else {
                            let newNote = Note(content: content)
                            viewModel.add(note: newNote, to: folderIndex)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

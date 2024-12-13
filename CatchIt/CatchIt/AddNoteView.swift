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
    
    var noteToEdit: Note? = nil
    var noteIndex: Int? = nil

    init(viewModel: NotesViewModel, noteToEdit: Note? = nil, noteIndex: Int? = nil) {
        self.viewModel = viewModel
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
                            viewModel.update(note: updatedNote, at: index)
                        } else {
                            let newNote = Note(content: content)
                            viewModel.add(note: newNote)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

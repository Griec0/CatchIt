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
    @State private var title: String = ""
    @State private var content: String = ""
    
    let folderIndex: Int
    var noteToEdit: Note? = nil
    var noteIndex: Int? = nil

    init(viewModel: NotesViewModel, folderIndex: Int, noteToEdit: Note? = nil, noteIndex: Int? = nil) {
        self.viewModel = viewModel
        self.folderIndex = folderIndex
        self.noteToEdit = noteToEdit
        self.noteIndex = noteIndex
        _title = State(initialValue: noteToEdit?.title ?? "")
        _content = State(initialValue: noteToEdit?.content ?? "")
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Inserisci un titolo", text: $title)
                    .font(.title)
                    .padding()
                TextEditor(text: $content)
                    .font(.body)
                    .padding()
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salva") {
                        if let noteToEdit = noteToEdit, let index = noteIndex {
                            var updatedNote = noteToEdit
                            updatedNote.title = title
                            updatedNote.content = content
                            updatedNote.date = Date()
                            viewModel.update(note: updatedNote, in: folderIndex, at: index)
                        } else {
                            let newNote = Note(title: title, content: content)
                            viewModel.add(note: newNote, to: folderIndex)
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

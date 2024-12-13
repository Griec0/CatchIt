//
//  NoteView.swift
//  CatchIt
//
//  Created by Giano on 13/12/24.
//

import SwiftUI

struct NotesView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var isPresentingAddNote = false
    @State private var noteToEdit: Note? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.notes.enumerated()), id: \ .element.id) { index, note in
                    NavigationLink(destination: AddNoteView(viewModel: viewModel, noteToEdit: note, noteIndex: index)) {
                        VStack(alignment: .leading) {
                            Text(note.content)
                                .font(.headline)
                            Text(note.date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Le mie Note")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isPresentingAddNote = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddNote) {
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}


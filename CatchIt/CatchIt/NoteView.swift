//
//  NoteView.swift
//  CatchIt
//
//  Created by Giano on 13/12/24.
//

import SwiftUI

struct NotesView: View {
    @ObservedObject var viewModel: NotesViewModel
    let folderIndex: Int
    @State private var isPresentingAddNote = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.folders[folderIndex].notes.enumerated()), id: \ .element.id) { index, note in
                    NavigationLink(destination: AddNoteView(viewModel: viewModel, folderIndex: folderIndex, noteToEdit: note, noteIndex: index)) {
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
            .navigationTitle(viewModel.folders[folderIndex].name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isPresentingAddNote = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddNote) {
                AddNoteView(viewModel: viewModel, folderIndex: folderIndex)
            }
        }
    }
}

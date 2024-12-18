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

    var body: some View {
        List {
            ForEach(Array(viewModel.folders[folderIndex].notes.enumerated()), id: \ .element.id) { index, note in
                NavigationLink(destination: NoteDetailView(viewModel: viewModel, folderIndex: folderIndex, noteIndex: index)) {
                    VStack(alignment: .leading) {
                        Text(note.title)
                            .font(.headline)
                        Text(note.content)
                            .lineLimit(1)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onDelete { indices in
                indices.forEach { index in
                    let noteTitle = viewModel.folders[folderIndex].notes[index].title
                    viewModel.delete(noteAt: index, in: folderIndex)
                    UIAccessibility.post(notification: .announcement, argument: "Deleted \(noteTitle) note.")
                }
            }
        }
        .navigationTitle(viewModel.folders[folderIndex].name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: NoteDetailView(viewModel: viewModel, folderIndex: folderIndex)) {
                    Image(systemName: "plus")
                        .accessibilityLabel("Add a new note")
                }
            }
        }
    }
}

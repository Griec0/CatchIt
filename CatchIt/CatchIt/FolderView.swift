//
//  FolderView.swift
//  CatchIt
//
//  Created by Giano on 16/12/24.
//

import SwiftUI

struct FoldersView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var isPresentingAddFolder = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.folders.enumerated()), id: \ .element.id) { index, folder in
                    NavigationLink(destination: NotesView(viewModel: viewModel, folderIndex: index)) {
                        VStack(alignment: .leading) {
                            Text(folder.name)
                                .font(.headline)
                            Text("\(folder.notes.count) note(s)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Cartelle")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isPresentingAddFolder = true }) {
                        Image(systemName: "folder.badge.plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddFolder) {
                AddFolderView(viewModel: viewModel)
            }
        }
    }
}

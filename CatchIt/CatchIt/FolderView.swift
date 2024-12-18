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
    @State private var isPresentingCalendarView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(Array(viewModel.folders.enumerated()), id: \ .element.id) { index, folder in
                    NavigationLink(destination: NotesView(viewModel: viewModel, folderIndex: index)) {
                        VStack(alignment: .leading) {
                            Text(folder.name)
                                .font(.headline)
                                .accessibilityLabel("Cartella \(folder.name)")
                            Text("\(folder.notes.count) note(s)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .accessibilityLabel("\(folder.notes.count) note")
                        }
                    }
                }
                .onDelete { indices in
                    indices.forEach { index in
                        let folderName = viewModel.folders[index].name
                        viewModel.deleteFolder(at: index)
                        UIAccessibility.post(notification: .announcement, argument: "Cartella \(folderName) eliminata.")
                    }
                }
            }
            .navigationTitle("Cartelle")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: { isPresentingCalendarView = true }) {
                        Image(systemName: "calendar")
                            .accessibilityLabel("Apri il calendario")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isPresentingAddFolder = true }) {
                        Image(systemName: "folder.badge.plus")
                            .accessibilityLabel("Aggiungi una nuova cartella")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddFolder) {
                AddFolderView(viewModel: viewModel)
            }
            .sheet(isPresented: $isPresentingCalendarView) {
                MonthlyCalendarView(viewModel: viewModel)
            }
        }
    }
}

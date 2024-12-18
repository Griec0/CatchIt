//
//  AddFolderView.swift
//  CatchIt
//
//  Created by Giano on 16/12/24.
//

import SwiftUI

struct AddFolderView: View {
    
    @Environment(\ .presentationMode) var presentationMode
    @ObservedObject var viewModel: NotesViewModel
    @State private var folderName: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Nome Cartella", text: $folderName)
                    .accessibilityLabel("Nome della nuova cartella")
            }
            .navigationBarTitle("Aggiungi Cartella", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Annulla") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salva") {
                        if !folderName.isEmpty {
                            viewModel.addFolder(folder: Folder(name: folderName))
                        }
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

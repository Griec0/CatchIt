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
            VStack {
                TextField("Nome Cartella", text: $folderName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salva") {
                        let newFolder = Folder(name: folderName)
                        viewModel.addFolder(folder: newFolder)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

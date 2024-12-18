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
                TextField("New Folder", text: $folderName)
                    .accessibilityLabel("Name of the new folder")
            }
            .navigationBarTitle("Add Folders", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
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

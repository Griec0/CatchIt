//
//  FolderModel.swift
//  CatchIt
//
//  Created by Giano on 17/12/24.
//

import SwiftUI

class Folder: Identifiable, Codable {
    let id: UUID
    var name: String
    var notes: [Note]

    init(name: String, notes: [Note] = []) {
        self.id = UUID()
        self.name = name
        self.notes = notes
    }
}

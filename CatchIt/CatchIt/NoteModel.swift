//
//  NoteModel.swift
//  CatchIt
//
//  Created by Giano on 17/12/24.
//

import SwiftUI

struct Note: Identifiable, Codable {
    let id: UUID
    var title: String
    var content: String
    var date: Date

    init(title: String, content: String, date: Date = Date()) {
        self.id = UUID()
        self.title = title
        self.content = content
        self.date = date
    }
}

//
//  NotesForDateView.swift
//  CatchIt
//
//  Created by Giano on 16/12/24.
//

import SwiftUI

struct NotesForDateView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    
    var date: Date

    private var notesForDate: [Note] {
        let startOfDay = Calendar.current.startOfDay(for: date)
        return viewModel.folders.flatMap { $0.notes }.filter {
            Calendar.current.isDate($0.date, inSameDayAs: startOfDay)
        }
    }

    var body: some View {
        List(notesForDate) { note in
            VStack(alignment: .leading) {
                Text(note.title)
                    .font(.headline)
                Text(note.content)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

//
//  CalendarView.swift
//  CatchIt
//
//  Created by Giano on 18/12/24.
//

import SwiftUI

struct CalendarView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    @Binding var selectedDate: Date?

    private var notesByDate: [Date: [Note]] {
        Dictionary(grouping: viewModel.folders.flatMap { $0.notes }) { note in
            Calendar.current.startOfDay(for: note.date)
        }
    }

    var body: some View {
        VStack {
            let calendar = Calendar.current
            let today = calendar.startOfDay(for: Date())
            let components = calendar.dateComponents([.year, .month], from: today)
            let firstDayOfMonth = calendar.date(from: components) ?? today
            let range = calendar.range(of: .day, in: .month, for: firstDayOfMonth) ?? 1..<31

            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 16) {
                ForEach(range, id: \ .self) { day in
                    let date = calendar.date(byAdding: .day, value: day - 1, to: firstDayOfMonth) ?? today
                    VStack {
                        Text("\(day)")
                            .font(.headline)
                        if notesByDate[date] != nil {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 8, height: 8)
                        }
                    }
                    .onTapGesture {
                        selectedDate = date
                    }
                }
            }
        }
    }
}

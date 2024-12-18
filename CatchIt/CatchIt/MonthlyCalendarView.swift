//
//  MonthlyCalendarView.swift
//  CatchIt
//
//  Created by Giano on 16/12/24.
//

import SwiftUI

struct MonthlyCalendarView: View {
    
    @ObservedObject var viewModel: NotesViewModel
    @Environment(\ .presentationMode) var presentationMode
    @State private var selectedDate: Date? = nil

    var body: some View {
        NavigationView {
            VStack {
                CalendarView(viewModel: viewModel, selectedDate: $selectedDate)
                    .padding()
                if let date = selectedDate {
                    NotesForDateView(viewModel: viewModel, date: date)
                } else {
                    Spacer()
                }
            }
            .navigationTitle("Calendar")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

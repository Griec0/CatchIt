//
//  ContentView.swift
//  CatchIt
//
//  Created by Giano on 10/12/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {

        HStack{
            Text("Back")
                .foregroundStyle(.blue)
            Spacer()
            Text("Settings")
            Spacer()
            Image(systemName: "gear")
                .foregroundStyle(.blue)
        }.padding()
        
        List {
            Text("Setting 1")
            Text("Setting 2")
            Text("Setting 3")
            Text("Setting 4")
        }
    }
}

#Preview {
    ContentView()
}

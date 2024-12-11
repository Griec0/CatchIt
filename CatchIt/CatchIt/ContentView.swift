//
//  ContentView.swift
//  CatchIt
//
//  Created by Giano on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Spacer()    //Utilizzata per portare la NavBar sopra
                        NavigationLink(destination: SettingsView()) {
                            Text("Settings")
                        }
                    }
                    .padding()
                    .padding(.trailing, 10)
                    Spacer()
                }
            }
        }
    }
}
#Preview {
    ContentView()
}

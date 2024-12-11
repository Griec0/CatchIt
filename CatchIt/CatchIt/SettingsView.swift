//
//  SettingsView.swift
//  CatchIt
//
//  Created by Giano on 11/12/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationStack{
            ZStack{
                VStack{
                    HStack{
                    }
                    Form{
                        Section("General Settings"){
                            Text("Opt 1")
                            Text("Opt 2")
                            
                        }
                        Section("Accecibility Settings"){
                            Toggle(isOn: .constant(true), label: {
                                Text("Dark Mode")
                            })
                        }
                    }
                    .navigationTitle("Settings")
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}

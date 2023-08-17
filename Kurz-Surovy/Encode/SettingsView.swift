//
//  SettingsView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 16/08/2023.
//

import SwiftUI

struct SettingsView: View {
    let codeModel = Code()
    @State private var myAlphabet : String = "alphabet"
    @State private var numberOfTimes : Int = 0
    @State private var modulo : Int = 0
    
    
    var body: some View {
        Form {
            SwiftUI.Section ("Enter your own alphabet") {
                TextField("Alphabet", text: $myAlphabet)
            }
            SwiftUI.Section ("Set you encryption parameters"){
                Picker("How many times is message encoded", selection: $numberOfTimes) {
                    ForEach(0...5, id: \.self){ number in
                        Text(String(number))
                    }
                }.pickerStyle(.menu)
                Picker("Modulo of computing encryption", selection: $modulo) {
                    ForEach(0...5, id: \.self){ number in
                        Text(String(number))
                    }
                }
            }
        }
        .navigationTitle("Settings")
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
            
        }
    }
}

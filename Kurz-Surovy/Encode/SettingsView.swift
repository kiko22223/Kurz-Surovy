//
//  SettingsView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 16/08/2023.
//

import SwiftUI

struct SettingsView: View {
    let codeSettings: CodeSettings
    let completion: (CodeSettings) -> Void
    @Environment(\.presentationMode) var presentation
    @State var myAlphabet : String = ""
    @State private var numberOfTimes : Int = 0
    @State private var modulo : Int = 1
    
    var body: some View {
        Form(content: {
            SwiftUI.Section ("Enter your own alphabet") {
                TextField("Alphabet", text: $myAlphabet, axis: .vertical)
                    .lineLimit(4)
            }
            SwiftUI.Section ("Set you encryption parameters"){
                Picker("How many times is message encoded", selection: $numberOfTimes) {
                    ForEach(0...5, id: \.self){ number in
                        Text(String(number))
                    }
                }.pickerStyle(.menu)
                Picker("Modulo of computing encryption", selection: $modulo) {
                    ForEach(1...5, id: \.self){ number in
                        Text(String(number))
                    }
                }.pickerStyle(.menu)
            }
            SwiftUI.Section("") {
                Button("Save") {
                    let newSettings = CodeSettings(alphabet: myAlphabet,
                                                   numberOfIterations: numberOfTimes,
                                                   modulo: modulo)
                    newSettings.save(key: Constants.codeSettingsKey)
                    completion(newSettings)
                    presentation.wrappedValue.dismiss()
                }
            }
        })
        .navigationTitle("Settings")
        .onAppear{
            myAlphabet = codeSettings.alphabet
            numberOfTimes = codeSettings.numberOfIterations
            modulo = codeSettings.modulo
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView(codeSettings: CodeSettings()) {_ in}
        }
    }
}

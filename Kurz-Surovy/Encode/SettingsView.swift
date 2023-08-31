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
    @State private var offsets : String = ""
    
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
                TextField("Offsets", text: $offsets)
                    .keyboardType(.decimalPad)
            }
            SwiftUI.Section("") {
                Button("Save") {
                    let stringParts = offsets.split(separator: Constants.separator)
                    var numbers = [Int]()
                    for str in stringParts {
                        if let number = Int(str) {
                            numbers.append(number)
                        }
                    }
                    print(numbers)
                    let newSettings = CodeSettings(alphabet: myAlphabet,
                                                   numberOfIterations: numberOfTimes,
                                                   offsets: numbers)
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
            offsets = codeSettings.offsets.map({String($0)}).joined(separator: Constants.separator)
            print(offsets)
        }
        .toolbar {
            Image(systemName: "opticaldiscdrive")
            Image(systemName: "square.and.arrow.up")
        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView(codeSettings: CodeSettings()) {_ in}
        }
    }
}

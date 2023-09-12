//
//  EditSettingsView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 16/08/2023.
//

import SwiftUI

struct EditSettingsView: View {
    let codeSettings: CodeSettings
    let isDefault: Bool
    let completion: (CodeSettings) -> Void

    @Environment(\.presentationMode) var presentation
    @State var myAlphabet : String = ""
    @State private var numberOfTimes : Int = 0
    @State private var offsets : String = ""

    func prepareToSave() -> CodeSettings {
        let stringParts = offsets.split(separator: Constants.separator)
        var numbers = [Int]()
        for str in stringParts {
            if let number = Int(str) {
                numbers.append(number)
            }
        }
        if numbers.count > numberOfTimes {
            numbers = numbers.dropLast(numbers.count - numberOfTimes)
        } else if numbers.count < numberOfTimes {
            numbers += Array(repeating: 0, count: numberOfTimes - numbers.count)
        }
        return CodeSettings(alphabet: myAlphabet,
                            numberOfIterations: numberOfTimes,
                            offsets: numbers)
    }

    func makeJSON() -> String {
        let settings = prepareToSave()
        let data = try! JSONEncoder().encode(settings)
        return String(data: data, encoding: .utf8)!
    }
    
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
                HStack {
                    Text("Enter offsets for individual iterations divided by \".\"")
                    TextField("Offsets", text: $offsets)
                        .keyboardType(.decimalPad)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.trailing)
                }
            }
            if !isDefault {
                SwiftUI.Section("") {
                    Button("Save") {
                        let newSettings = prepareToSave()
                        newSettings.save(key: Constants.codeSettingsKey)
                        completion(newSettings)
                        presentation.wrappedValue.dismiss()
                    }
                }
            }
        })
        .navigationTitle(isDefault ? "Default setting detail" : "Edit setting")
        .onAppear{
            myAlphabet = codeSettings.alphabet
            numberOfTimes = codeSettings.numberOfIterations
            offsets = codeSettings.offsets.map({String($0)}).joined(separator: Constants.separator)
        }
        .disabled(isDefault)
        .toolbar {
            ToolbarItem {
                ShareLink(item: makeJSON()) {
                    Image(systemName: "square.and.arrow.up")
                }.tint(.green)
            }

        }
    }
    
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            EditSettingsView(codeSettings: CodeSettings(), isDefault: true) {_ in}
        }
    }
}

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
    @State private var offsetsStr : String = ""
    @State private var selectedOption : String = "Default"
    @State private var newOption : String = ""
    @State private var showModal = false
    
    func stringFrom(intArray:[Int]) -> String{
        return intArray.map({String($0)}).joined(separator: Constants.separator)
    }
    
    func prepareToSave() -> CodeSettings {
        return CodeSettings(alphabet: myAlphabet,
                            numberOfIterations: numberOfTimes,
                            offsets: alignOffsets(numberOfTimes: numberOfTimes))
    }
    
    
    func alignOffsets(numberOfTimes: Int) -> [Int] {
        let stringParts = offsetsStr.split(separator: Constants.separator)
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
        return numbers
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
                    .onChange(of: numberOfTimes) { newValue in
                        let cleanedArray = alignOffsets(numberOfTimes: newValue)
                        offsetsStr = stringFrom(intArray:cleanedArray)
                    }
                HStack {
                    Text("Enter offsets for individual iterations divided by \".\"")
                    TextField("Offsets", text: $offsetsStr)
                        .keyboardType(.decimalPad)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.trailing)
                }
            }
        })
        
        .navigationTitle(isDefault ? "Default setting detail" : "Edit setting")
        .onAppear{
            myAlphabet = codeSettings.alphabet
            numberOfTimes = codeSettings.numberOfIterations
            offsetsStr = stringFrom(intArray:codeSettings.offsets)
            
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
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        EditSettingsView(codeSettings: CodeSettings(), isDefault: true) { _ in
        }
    }
}





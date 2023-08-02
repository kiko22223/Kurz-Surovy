//
//  Encode.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 23/07/2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct Encode: View {
    
    
    
    
    @State var hiddenMessage = ""
    let clipboard = UIPasteboard.general
    @State var copied = false
    @State var codeLevel = 1
    
    func alphabetInDictionary() -> [Character: Int] {
        let alphabet = "abcdefghijklmnopqrstuvwxyz1234567890?!"
        var alphabetDict = [Character: Int]()
        
        for (index, char) in alphabet.enumerated() {
            let position = index + 1
            alphabetDict[char] = position
        }
        
        return alphabetDict
    }
    
    func codeString (word: String) -> [Int] {
        let dictionary = alphabetInDictionary()
        var arrayOfIndexes = [Int]()
        let word = word.lowercased()
        for letter in word {
            arrayOfIndexes.append(dictionary[letter] ?? 0)
        }
        return arrayOfIndexes
    }
    
    
    var body: some View {
        Form(content: {
            SwiftUI.Section("Enter your message you want to hide") {
                TextField("Enter message", text: $hiddenMessage).disableAutocorrection(true)
                        .keyboardType(.alphabet)
                TextField("Select your code level", value: $codeLevel, format: .number).keyboardType(.decimalPad)
            }
                SwiftUI.Section("Your coded message in numbers"){
                Text(String("\(codeString(word:hiddenMessage).map{String($0)}.joined(separator: " "))"))
                if copied {
                    Text("Copied!").foregroundColor(.red).bold().font(.title)
                } else {
                    Button("Copy To clipboard") {
                        clipboard.string = (String("\(codeString(word:hiddenMessage).map{String($0)}.joined(separator: " "))"))
                        copied = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            copied = false
                        }
                    }
                }
            }
            
        })
    }
}



struct Encode_Previews: PreviewProvider {
    static var previews: some View {
        Encode()
    }
}

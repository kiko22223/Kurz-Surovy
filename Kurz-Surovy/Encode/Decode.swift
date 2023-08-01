//
//  Decode.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 23/07/2023.
//

import SwiftUI

struct Decode: View {
    @State private var numbersMessage : String = ""
    
    func createIntCharDictionary() -> [Int : Character] {
        let alphabet = "abcdefghijklmnopqrstuvwxyz1234567890?!"
        var alphabetDict = [Int : Character]()
        
        for (index, char) in alphabet.enumerated() {
            let position = index + 1
            alphabetDict[position] = char
        }
        
        return alphabetDict
    }
    
    func decodeString (code: [Int]) -> String{
        
        let dictionary = createIntCharDictionary()
        var arrayOfChar = [Character]()
        for number in code {
            if dictionary[number] == nil || number == 0 {
                arrayOfChar.append(" ")
            } else {
                arrayOfChar.append(dictionary[number]!)
            }
        }
        return String(arrayOfChar)
        
    }
    
    func stringToArrayOfInts (input: String) -> [Int] {
        let stringParts = input.split(separator: " ")
        var result = [Int]()
        for str in stringParts {
            if let number = Int(str) {
                result.append(number)
            }

        }
        return result
//        return stringParts.map({Int($0) ?? 0}) Skrateny zapis vyssie
//        return stringParts.compactMap({Int($0)}) Skrateny zapis vyssie
    }
    
    
    
    var body: some View {
        Form(content: {
            SwiftUI.Section("Enter your message you want to hide") {
                TextField("Enter your message to decode", text: $numbersMessage)
            }

            SwiftUI.Section("Your decoded message"){
                Text(decodeString(code:stringToArrayOfInts(input: numbersMessage)))
            }
        })
    }
}

struct Decode_Previews: PreviewProvider {
    static var previews: some View {
        Decode()
    }
}

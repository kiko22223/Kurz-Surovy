//
//  DecodeFuncs.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 02/08/2023.
//

import Foundation

struct DecodeFuncs {
    func createIntCharDictionary() -> [Int : Character] {
        let alphabet = "abcdefghijklmnopqrstuvwxyz1234567890?!"
        var alphabetDict = [Int : Character]()
        
        for (index, char) in alphabet.enumerated() {
            let position = index + 1
            alphabetDict[position] = char
        }
        
        return alphabetDict
    }
    
    func stringToArrayOfInts (input: String) -> String {
        
        var arrayOfChar = [Character]()
        let dictionary = createIntCharDictionary()
        
        let stringParts = input.split(separator: " ")
        var result = [Int]()
        for str in stringParts {
            if let number = Int(str) {
                result.append(number)
            }
            
        }
        for number in result {
            if dictionary[number] == nil || number == 0 {
                arrayOfChar.append(" ")
            } else {
                arrayOfChar.append(dictionary[number]!)
            }
        }
        return String(arrayOfChar)
        //        return stringParts.map({Int($0) ?? 0}) Skrateny zapis vyssie
        //        return stringParts.compactMap({Int($0)}) Skrateny zapis vyssie
    }
}

//
//  EncodeFuncs.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 02/08/2023.
//

import Foundation

struct EncodeViewFuncs {
    func alphabetInDictionary() -> [Character: Int] {
        let alphabet = "abcdefghijklmnopqrstuvwxyz1234567890?!"
        var alphabetDict = [Character: Int]()
        
        for (index, char) in alphabet.enumerated() {
            let position = index + 1
            alphabetDict[char] = position
        }
        
        return alphabetDict
    }
    
    func codeString (word: String) -> String {
        let dictionary = alphabetInDictionary()
        var arrayOfIndexes = [Int]()
        let word = word.lowercased()
        for letter in word {
            arrayOfIndexes.append(dictionary[letter] ?? 0)
        }
        return String(arrayOfIndexes.map({String($0)}).joined(separator: " "))
    }
    
}

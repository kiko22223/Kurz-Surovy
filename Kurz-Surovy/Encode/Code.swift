//
//  Alphabet.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 03/08/2023.
//

import Foundation
class Code {
    fileprivate let alphabet = "aáäbcčdďdzdžeéfghchiíjklĺľmnňoóôpqrŕsštťuúvwxyýzž1234567890?!"
}

class Encode: Code {
    private func alphabetInDictionary() -> [Character: Int] {
        
        var alphabetDict = [Character: Int]()
        
        for (index, char) in alphabet.enumerated() {
            let position = index + 1
            alphabetDict[char] = position
        }
        
        return alphabetDict
    }
    
    public func codeString (word: String) -> String {
        let dictionary = alphabetInDictionary()
        var arrayOfIndexes = [Int]()
        let word = word.lowercased()
        for letter in word {
            arrayOfIndexes.append(dictionary[letter] ?? 0)
        }
        return String(arrayOfIndexes.map({String($0)}).joined(separator: " "))
    }
    
}

class Decode: Code {
    private func createIntCharDictionary() -> [Int : Character] {
        var alphabetDict = [Int : Character]()
        
        for (index, char) in alphabet.enumerated() {
            let position = index + 1
            alphabetDict[position] = char
        }
        
        return alphabetDict
    }
    
   public func decodeInts (input: String) -> String {
        
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

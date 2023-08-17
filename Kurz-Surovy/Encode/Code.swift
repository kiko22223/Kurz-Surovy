//
//  Alphabet.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 03/08/2023.
//

import Foundation
import SwiftUI
class Code {
    
    fileprivate let alphabet = "aáäbcčdďdzdžeéfghchiíjklĺľmnňoóôpqrŕsštťuúvwxyýzž1234567890?!"

    func alphabet (alph: String) -> String {
        if alph.isEmpty {
            return "aáäbcčdďdzdžeéfghchiíjklĺľmnňoóôpqrŕsštťuúvwxyýzž1234567890?!"
        } else {
            return alph
        }
    }
    
    var count : Int {
        return alphabet.count
    }
    func moveAlphabet(with _offset: Int) -> String {
        //    let offset = offset > alphabet.count - 1 ? offset % alphabet.count : offset
        var offset = abs(_offset)
        if _offset > alphabet.count - 1 {
            offset = _offset % alphabet.count
        } else {
            offset = _offset
        }
        
        if offset == 0 {
            return alphabet
        }
        let tail = alphabet.suffix(offset)
        return tail + String(alphabet.dropLast(offset))
    }
    
    func movedIndex(position: Int, with offset: Int) -> Int {
        let absOffset = abs(offset)
        let offset = absOffset > alphabet.count - 1 ? absOffset % alphabet.count : absOffset
        if offset == 0 {
            return position
        }
        let sum = position + offset
        return sum < alphabet.count ? sum : sum % alphabet.count
    }
}

class Encode: Code {
    private func alphabetInDictionary(offset: Int) -> [Character: Int] {
        
        var alphabetDict = [Character: Int]()
        
        for (index, char) in moveAlphabet(with: offset).enumerated() {
            let position = index + 1
            alphabetDict[char] = position
        }
        
        return alphabetDict
    }
    
    public func codeString (text: String, numberOfIterations: Int) -> String {
        if numberOfIterations == 0 {
            return text
        }
        let dictionary = alphabetInDictionary(offset: 0)
        var arrayOfIndexes = [Int]()
        let text = text.lowercased()
        for letter in text {
            arrayOfIndexes.append(dictionary[letter] ?? 0)
        }
        let codedText = String(arrayOfIndexes.map({String($0)}).joined(separator: " "))
        return codeString(text: codedText, numberOfIterations: numberOfIterations - 1)
    }
    
}

class Decode: Code {
    private func createIntCharDictionary(offset : Int) -> [Int : Character] {
        var alphabetDict = [Int : Character]()
        
        for (index, char) in alphabet.enumerated() {
            let position = movedIndex(position: index + 1, with: offset)
            alphabetDict[position] = char
        }
        
        return alphabetDict
    }
    
    public func decodeInts (input: String, numberOfIterations: Int) -> String {
        
        if numberOfIterations == 0 {
            return input
        }
        
        var arrayOfChar = [Character]()
        let dictionary = createIntCharDictionary(offset: 0)
        
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
        let decodedText = String(arrayOfChar)
        return decodeInts(input: decodedText, numberOfIterations: numberOfIterations - 1)
        //        return stringParts.map({Int($0) ?? 0}) Skrateny zapis vyssie
        //        return stringParts.compactMap({Int($0)}) Skrateny zapis vyssie
    }
}

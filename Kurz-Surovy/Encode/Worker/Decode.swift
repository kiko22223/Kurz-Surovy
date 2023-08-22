//
//  Decode.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 22/08/2023.
//

class Decode: Code {
    private func createIntCharDictionary(offset : Int) -> [Int : Character] {
        var alphabetDict = [Int : Character]()
        
        for (index, char) in settings.alphabet.enumerated() {
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
        var numbers = [Int]()
        for str in stringParts {
            if let number = Int(str) {
                numbers.append(number)
            }
        }
        //        let numbers = stringParts.map({Int($0) ?? 0}) Skrateny zapis vyssie
        //        let numbers = stringParts.compactMap({Int($0)}) Skrateny zapis vyssie
        
        for number in numbers {
            if dictionary[number] == nil || number == 0 {
                arrayOfChar.append(" ")
            } else {
                arrayOfChar.append(dictionary[number]!)
            }
        }
        let decodedText = String(arrayOfChar)
        return decodeInts(input: decodedText, numberOfIterations: numberOfIterations - 1)
    }
}


//
//  Encode.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 22/08/2023.
//

class Encode: Code {
    private func alphabetInDictionary(offset: Int) -> [Character: Int] {
        
        var alphabetDict = [Character: Int]()
        
        for (index, char) in moveAlphabet(with: offset).enumerated() {
            let position = index + 1
            alphabetDict[char] = position
        }
        
        return alphabetDict
    }
    
    public func codeString (text: String) -> String {
        if settings.numberOfIterations == 0 {
            return text
        }
        return codeString(text: text, iteration: settings.numberOfIterations)
    }
    
    private func codeString (text: String, iteration: Int) -> String {
        if iteration == 0 {
            return text
        }
        let dictionary = alphabetInDictionary(offset: settings.offsets[safe:settings.numberOfIterations - iteration] ?? 0)
        print(iteration, settings.numberOfIterations - iteration)
        var arrayOfIndexes = [Int]()
        let text = text.lowercased()
        for letter in text {
            arrayOfIndexes.append(dictionary[letter] ?? 0)
        }
        let codedText = String(arrayOfIndexes.map({String($0)}).joined(separator: " "))
        return codeString(text: codedText, iteration: iteration - 1)
    }
    
}

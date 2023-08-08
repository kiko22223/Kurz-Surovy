//
//class Clovek {
//    var name : String
//
//    init(name : String) {
//        self.name = name
//    }
//}
//
//struct Zviera {
//    var name : String
//}
//
//var zviera1 = Zviera(name: "Arnold")
//
//zviera1.name = "Arnie"
//
//let clovek1 = Clovek(name: "Christian")
//clovek1.name = "Heisenberg"
//
//var zviera2 = zviera1
//zviera2.name = "Martin"
//
//print(zviera1,zviera2)
//
//let clovek2 = clovek1
//clovek2.name = "Ludomira"
//
//print(clovek1.name,clovek2.name)
//
//// slovnik ze pismenka od A do Z a priradit im cislo poradove
//// napisat funkciu napisem vetu alebo slovo a vratit pocet jednotlivych pismen napr ananas = a:3 n:2 s:1
//
//import Foundation
//
//
//func alphabetInDictionary() -> [Character: Int] {
//    let alphabet = "abcdefghijklmnopqrstuvwxyz"
//    var alphabetDict = [Character: Int]()
//
//    for (index, char) in alphabet.enumerated() {
//        let position = index + 1
//        alphabetDict[char] = position
//    }
//
//    return alphabetDict
//}
//
//let dictionary = alphabetInDictionary().sorted(by: <)
//print(dictionary)
//
//
//func countLetters (word: String){
//    var charCount = [Character : Int]()
//
//    for letter in word {
////        if let size = charCount[letter]{
////            charCount[letter] = size+1
////        } else {
////            charCount[letter] = 1
////        }
//
//        charCount[letter] = (charCount[letter] ?? 0 ) + 1
//
//    }
//    for (letter, size) in charCount {
//        print("\(letter) \(size)")
//    }
//}
//
//countLetters(word: "analphabet")
//
//func codeString (word: String) -> [Int] {
//    let dictionary = alphabetInDictionary()
//    var arrayOfIndexes = [Int]()
//    let word = word.lowercased()
//    for letter in word {
//        arrayOfIndexes.append(dictionary[letter] ?? 0)
//    }
//    return arrayOfIndexes
//}
//
//func createIntCharDictionary() -> [Int : Character] {
//    let alphabet = "abcdefghijklmnopqrstuvwxyz"
//    var alphabetDict = [Int : Character]()
//
//    for (index, char) in alphabet.enumerated() {
//        let position = index + 1
//        alphabetDict[position] = char
//    }
//
//    return alphabetDict
//}
//
//
//func decodeString (code: [Int]) -> String{
//
//    let dictionary = createIntCharDictionary()
//    var arrayOfChar = [Character]()
//    for number in code {
//        if dictionary[number] == nil || number == 0 {
//            arrayOfChar.append(" ")
//        } else {
//            arrayOfChar.append(dictionary[number]!)
//        }
//        //        arrayOfChar.append(number == 0 ? " " : dictionary[number] ?? " ") oneliner kodu vyssie
//    }
// return String(arrayOfChar)
//}
//
//codeString(word: "ahoj")
//
//let codedWord = codeString(word: "ahoj")
//
//decodeString(code: codedWord)
//
//
//func decodeString2 (code: [Int]) -> String{
//
//
//
//    let dictionary = createIntCharDictionary()
//    var resultString = ""
//    for number in code {
//        if dictionary[number] == nil || number == 0 {
//            resultString += " "
//        } else {
//            resultString += String(dictionary[number]!)
//        }
//    }
//    return resultString
//}
//
//// Aplikacia kde bude menu, polozky Kodovanie kde na vstupe bude cakat string a vrati cisla oddelene ciarkou,
////a Dekodovanie kde bude cakat cisla odddelene ciarkou a na vystupe vrati slovo
//
//

let alphabet = "abcdefghijklmnopqrstuvwxyz"


func moveAlphabet(with offset: Int) -> String {
    let offset = offset > alphabet.count - 1 ? offset % alphabet.count : offset
    if offset == 0 {
        return alphabet
    }
    let tail = alphabet.suffix(offset)
    return tail + String(alphabet.dropLast(offset))
}

for i in 0...10 {
    print(i, moveAlphabet(with: i))
}

func movedIndex(position: Int, with offset: Int) -> Int {
    let offset = offset > alphabet.count - 1 ? offset % alphabet.count : offset
    let sum = position + offset
    return sum < alphabet.count ? sum : sum % alphabet.count
}

func alphabetInDictionary(move: Int) -> [Character: Int] {
    var alphabetDict = [Character: Int]()
    
    for (index, char) in alphabet.enumerated() {
        let position = index + 1
        alphabetDict[char] = position
    }

    return alphabetDict
}

let dictionary = alphabetInDictionary(move: 15).sorted(by: <)
print(dictionary)

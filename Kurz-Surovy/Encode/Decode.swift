////
////  Decode.swift
////  Kurz-Surovy
////
////  Created by Christian Marušák on 23/07/2023.
////
//
//import SwiftUI
//
//struct Decode: View {
//    @State var numbersMessage = [Int]()
//    
//    func createIntCharDictionary() -> [Int : Character] {
//        let alphabet = "abcdefghijklmnopqrstuvwxyz"
//        var alphabetDict = [Int : Character]()
//        
//        for (index, char) in alphabet.enumerated() {
//            let position = index + 1
//            alphabetDict[position] = char
//        }
//        
//        return alphabetDict
//    }
//    
//    func decodeString (code: [Int]) -> String{
//        
//        let dictionary = createIntCharDictionary()
//        var arrayOfChar = [Character]()
//        for number in code {
//            if dictionary[number] == nil || number == 0 {
//                arrayOfChar.append(" ")
//            } else {
//                arrayOfChar.append(dictionary[number]!)
//            }
//            //        arrayOfChar.append(number == 0 ? " " : dictionary[number] ?? " ") oneliner kodu vyssie
//        }
//        return String(arrayOfChar)
//    }
//    
//    
//    var body: some View {
//        Form(content: {
//            SwiftUI.Section("Enter your message you want to hide") {
//                TextField("Enter message", value: $numbersMessage) // ako sem pridam formatter a naco sluzi ?
//            }
//            SwiftUI.Section("Your coded message in numbers"){
//                Text(decodeString(code:numbersMessage))
//            }
//        })
//    }
//}
//
//struct Decode_Previews: PreviewProvider {
//    static var previews: some View {
//        Decode()
//    }
//}

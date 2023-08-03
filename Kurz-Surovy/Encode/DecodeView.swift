//
//  Decode.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 23/07/2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct DecodeView: View {
    @State private var numbersMessage : String = ""
    let decodeFuncs = Decode()
    @State var copied = false
    let clipboard = UIPasteboard.general
    
    var body: some View {
        Form(content: {
            SwiftUI.Section("Enter your message you want to hide") {
                TextField("Enter your message to decode", text: $numbersMessage)
            }

            SwiftUI.Section("Your decoded message"){
                Text(decodeFuncs.decodeInts(input: numbersMessage))
                if copied {
                    Text("Copied!").foregroundColor(.red).bold().font(.title)
                } else {
                    Button("Copy To clipboard") {
                        clipboard.string = decodeFuncs.decodeInts(input: numbersMessage)
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

struct Decode_Previews: PreviewProvider {
    static var previews: some View {
        DecodeView()
    }
}

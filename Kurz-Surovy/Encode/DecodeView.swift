//
//  Decode.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 23/07/2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct DecodeView: View {
    @State var copied = false
    @State private var numbersMessage : String = ""
    @State private var numberOfTimes = 0
    @State private var unhiddenMessage : String = ""
    @State private var computing = false
    
    let clipboard = UIPasteboard.general
    let decodeFuncs = Decode()
    
    private func compute() {
        computing = true
        unhiddenMessage = decodeFuncs.decodeInts(input: numbersMessage, numberOfIterations: numberOfTimes)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            computing = false
        }
    }
    
    var body: some View {
        Form(content: {
            SwiftUI.Section("Enter your message you want to show") {
                TextField("Enter your message to decode", text: $numbersMessage)
                    .disableAutocorrection(true)
                    .onChange(of: numbersMessage) { _ in
                        compute()
                    }
                Picker("How many times is message decoded", selection: $numberOfTimes) {
                    ForEach(0...5, id: \.self){ number in
                        Text(String(number))
                    }
                }.pickerStyle(.menu)
                    .onChange(of: numberOfTimes) { _ in
                        compute()
                    }
            }
            if computing {
                Text("Computing")
            }

            SwiftUI.Section("Your decoded message"){
                Text(unhiddenMessage)
                if copied {
                    Text("Copied!").foregroundColor(.red).bold().font(.title)
                } else {
                    Button("Copy To clipboard") {
                        clipboard.string = unhiddenMessage
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

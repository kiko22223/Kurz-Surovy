//
//  Encode.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 23/07/2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct EncodeView: View {
    
let encodeFuncs = Encode()
    @State private var numberOfTimes = 0
    
  
    
    @State var hiddenMessage = ""
    let clipboard = UIPasteboard.general
    @State var copied = false

        var body: some View {
        Form(content: {
            SwiftUI.Section("Enter your message you want to hide") {
                TextField("Enter message", text: $hiddenMessage)
                    .disableAutocorrection(true)
                Picker("How many times is message encoded", selection: $numberOfTimes) {
                    ForEach(0...Code().count, id: \.self){ number in
                        Text(String(number))
                    }
                }.pickerStyle(.menu)
            }
            SwiftUI.Section("Your coded message in numbers"){
                Text(encodeFuncs.codeString(word: hiddenMessage))
                if copied {
                    Text("Copied!").foregroundColor(.red).bold().font(.title)
                } else {
                    Button("Copy To clipboard") {
                        clipboard.string = encodeFuncs.codeString(word: hiddenMessage)
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



struct Encode_Previews: PreviewProvider {
    static var previews: some View {
        EncodeView()
    }
}
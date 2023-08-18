//
//  Encode.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 23/07/2023.
//

import SwiftUI
struct EncodeView: View {
    
    @State private var messageToHide = ""
    @State private var copied = false
    @State private var hiddenMessage : String = ""
    @State private var computing = false

    private let encodeFuncs = Encode()
    private let clipboard = UIPasteboard.general

    private func compute() {
        computing = true
        hiddenMessage = encodeFuncs.codeString(text: messageToHide)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            computing = false
        }
    }

    var body: some View {

        Form(content: {
            SwiftUI.Section("Enter your message you want to hide") {
                TextField("Enter message", text: $messageToHide)
                    .disableAutocorrection(true)
                    .onChange(of: messageToHide) { _ in
                        compute()
                    }
                }
            if computing {
                Text("Computing")
            }
            SwiftUI.Section("Your coded message in numbers") {
                if copied {
                    Text("Copied!").foregroundColor(.red).bold().font(.title)
                } else {
                    Button("Copy To clipboard") {
                        clipboard.string = hiddenMessage
                        copied = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            copied = false
                        }
                    }
                }
                Text(hiddenMessage)
            }
        })
        .toolbar{
            ToolbarItem {
                NavigationLink {
                    SettingsView()
                } label: {
                    Text("Settings")
                    Image(systemName: "gear")
                }.tint(.green)
            }
        }
        .navigationTitle("Encode")
//        .onAppear{compute()}
    }
}



struct Encode_Previews: PreviewProvider {
    static var previews: some View {
        EncodeView()
    }
}

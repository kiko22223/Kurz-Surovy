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
    @State private var encode: Encode
    
    private let clipboard = UIPasteboard.general
    
    init() {
        let settings = CodeSettings.load(key: Constants.codeSettingsKey) ?? CodeSettings()
        self.encode = Encode(settings: settings)
    }

    private func compute() {
        computing = true
        hiddenMessage = encode.codeString(text: messageToHide)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            computing = false
        }
    }

    var body: some View {

        Form {
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
        }
        .toolbar{
            ToolbarItem {
                NavigationLink {
                    SettingsView(codeSettings: encode.settings, completion: { newSettings in
                        encode = Encode(settings: newSettings)
                        compute()
                    })
                } label: {
                    Text("Settings")
                    Image(systemName: "gear")
                }.tint(.green)
            }
        }
        .navigationTitle("Encode")
    }
}



struct Encode_Previews: PreviewProvider {
    static var previews: some View {
        EncodeView()
    }
}

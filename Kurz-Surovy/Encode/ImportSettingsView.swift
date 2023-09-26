//
//  ImportSettingsView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 26/09/2023.
//

import SwiftUI

struct ImportSettingsView: View {
    
    @State private var json : String = ""
    
    func makeCodeSettings(from str: String) -> CodeSettings? {
        let jsonDecoder = JSONDecoder()
        do {
            guard let jsonData = str.data(using: .utf8) else { return nil }
            let settings = try jsonDecoder.decode(CodeSettings.self, from: jsonData)
            return settings
        } catch {
            print("Error:",error.localizedDescription)
            return nil
        }
    }
    
    var body: some View {
        TextField("Enter JSON text here", text: $json, axis: .vertical)
            .lineLimit(4...)
            .textFieldStyle(.roundedBorder)
            .padding()
            .onChange(of: json, perform: { value in
                print(makeCodeSettings(from: json.trimmingCharacters(in:.whitespacesAndNewlines)))
            })
    }
}

#Preview {
    ImportSettingsView()
}

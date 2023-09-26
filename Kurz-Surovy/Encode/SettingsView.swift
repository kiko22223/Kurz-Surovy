//
//  SettingsView.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 10/09/2023.
//

import Foundation
import SwiftUI


struct SettingsView: View {
    
    @State var codeSettings: CodeSettings?
    @State private var selectedOption : String = "Default"
    @State private var newOption : String = ""
    
    var body: some View {
        SwiftUI.Section ("All saved pressets") {
//            List {
//                ForEach(codeSettings!.profiles, id: \.self) { presset in
//                    Text(presset).tag(presset)
//                }
//            }
            TextField("Add new profile to save current", text: $newOption)
            Button("Save") {
//                if !newOption.isEmpty {
//                    codeSettings!.profiles.append(newOption)
//                    newOption = ""
//                }
            }
        }
    }
    
}
struct SettingsViewPreview: PreviewProvider {
    static var previews: some View {
        SettingsView(codeSettings: CodeSettings())
    }
}

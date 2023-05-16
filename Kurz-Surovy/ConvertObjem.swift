//
//  ConvertObjem.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 16/05/2023.
//

import SwiftUI

enum ObjemoveJednotky: String, CaseIterable {
    case liter = "l"
    case mililiter = "ml"
    case cup = "cup"
    case pint = "pt"
    case gallon = "gl"
    
}

struct ConvertObjem: View {
    @State private var zadanyObjem: Double = 1
    @State private var vstupnyObjem : ObjemoveJednotky = .liter
    
    var vstupnyObjemML: Double {
        switch vstupnyObjem {
        case .liter:
            return zadanyObjem * 1000
        case .mililiter:
            return zadanyObjem
        case .cup:
            return zadanyObjem * 236.588237
        case .pint:
            return zadanyObjem * 473.176473
        case .gallon:
            return zadanyObjem * 3785.41178
        }
    }
    
    var body: some View {
        Form{
            Section("Zadaj Objem") {
                TextField("Vloz objem", value: $zadanyObjem, format: .number)
                    .keyboardType(.decimalPad)
                
                Picker("Vyber vstupny objem", selection: $vstupnyObjem) {
                    ForEach(ObjemoveJednotky.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Objemove Jednotky"){
                ForEach(ObjemoveJednotky.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            
        }
        .navigationTitle("Objem")
    }
}

struct ConvertObjem_Previews: PreviewProvider {
    static var previews: some View {
        ConvertObjem()
    }
}

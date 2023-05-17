//
//  ConvertHmotnostView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 16/05/2023.
//

import SwiftUI

enum hmotnostneJednotky: String, CaseIterable  {
    case miligram = "mg"
    case gram = "g"
    case dekagram = "dk"
    case kilogram = "kg"
    case americkyCent = "q"
    case tona = "T"
}

struct ConvertHmotnostView: View {
    
    @State private var vstupnaHmotnost : hmotnostneJednotky = .kilogram
    @State private var zadanaHmotnost: Double = 1
    
    var vstupnaHmotnostMG: Double {
        switch vstupnaHmotnost {
        case .miligram:
            return zadanaHmotnost
        case .gram:
            return zadanaHmotnost * 1000
        case .dekagram:
            return zadanaHmotnost * 10000
        case .kilogram:
            return zadanaHmotnost * 1_000_000
        case .americkyCent:
            return zadanaHmotnost * 100_000_000
        case .tona:
            return zadanaHmotnost * 1_000_000_000
        }
    }
    var body: some View {
        Form{
            
            
            Section("Zadajte hmotnost"){
                TextField("Zadaj vstupnu hmotnost", value: $zadanaHmotnost, format: .number)
                    .keyboardType(.decimalPad)
            
            
                Picker("Vyber si druh jednotiek", selection: $vstupnaHmotnost) {
                    ForEach(hmotnostneJednotky.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Premene objemove jednotky"){
                ForEach(hmotnostneJednotky.allCases, id: \.self) { jednotka in
                    let hmotnostVypis = premen(vstupnaHmotnostMG, output: hmotnostneJednotky(rawValue: jednotka.rawValue)!)
                    Text("\(hmotnostVypis, specifier: "%.2f") \(jednotka.rawValue)")
                }
            }
            
        }
        .navigationTitle("Hmotnost")
    }
    func premen(_ vstup: Double, output: hmotnostneJednotky) -> Double {
        switch output {
        case .miligram:
            return vstup
        case .gram:
            return vstup / 1000
        case .dekagram:
            return vstup / 10000
        case .kilogram:
            return vstup / 1_000_000
        case .americkyCent:
            return vstup / 100_000_000
        case .tona:
            return vstup / 1000_000_000
        }
             }
    }
        


struct ConvertHmotnostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertHmotnostView()
    }
}

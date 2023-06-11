//
//  ConvertTeplotaView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 17/05/2023.
//

import SwiftUI


var units: Units!
enum teplotneJednotky: String, CaseIterable {
    case Joule = "J"
    case NewtomMeter = "Nm"
    case miliJoule = "mJ"
    case KiloJoule = "kJ"
    case MegaJoule = "Mj"
    case GigaJoule = "GJ"
    case TeraJoule = "TJ"
}

struct ConvertTeplotaView: View {
    @State private var zadanaTeplota: Double = 1
    @State private var vstupnaTeplota : teplotneJednotky = .Joule
    
    var vstupnaTeplotaMJ: Double {
        switch vstupnaTeplota {
        case .Joule:
            return zadanaTeplota * 1000
        case .NewtomMeter:
            return zadanaTeplota * 1000
        case .miliJoule:
            return zadanaTeplota
        case .KiloJoule:
            return zadanaTeplota * 1000000
        case .MegaJoule:
            return zadanaTeplota * 1000000000
        case .GigaJoule:
            return zadanaTeplota * 1_000_000_000_000
        case .TeraJoule:
            return zadanaTeplota * 1_000_000_000_000_000
        }
    }
    
    var body: some View {
        Form{
            Section("Vyber si teplotu") {
                TextField("Zadaj vstupnu teplotu", value: $zadanaTeplota, format: .number)
                    .keyboardType(.decimalPad)
                
                Picker("Vstupna teplota", selection: $vstupnaTeplota) {
                    ForEach(teplotneJednotky.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
                
                
            }
            Section("Premenene teplotne jednotky") {
                ForEach(teplotneJednotky.allCases, id: \.self) { jednotka in
                    let teplotnyVypis = premen(vstupnaTeplotaMJ, output: teplotneJednotky(rawValue: jednotka.rawValue)!)
                    Text("\(teplotnyVypis, specifier: "%.2f") \(jednotka.rawValue)")
                }
            }
            
        }
        .navigationTitle("Teplota")
        
    }
    
    func premen (_ vstup: Double, output: teplotneJednotky) -> Double{
        switch output {
        case .Joule:
            return vstup / 1000
        case .NewtomMeter:
            return vstup / 1000
        case .miliJoule:
            return vstup
        case .KiloJoule:
            return vstup / 1000000
        case .MegaJoule:
            return vstup / 1000000000
        case .GigaJoule:
            return vstup / 1_000_000_000_000
        case .TeraJoule:
            return vstup / 1_000_000_000_000_000
        }
    }
}

struct ConvertTeplotaView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertTeplotaView()
    }
}

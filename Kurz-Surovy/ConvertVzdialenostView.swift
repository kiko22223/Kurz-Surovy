//
//  ConvertVzdialenostView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 15/05/2023.
//

import SwiftUI

struct ConvertVzdialenostView: View {
    @State private var vstupnaVzdialenost: Double = 1
    @State private var vstupnaJednotka = "cm"
    
    let vsetkyJednotky = ["Km", "m", "cm", "mm", "Mi", "Yd", "Ft", "In"]
    
    var vstupnaVzdialenostMM: Double {
        var konvertovanieNaMilimetre: Double
        
        switch vstupnaJednotka {
        case "Km":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 1000000
        case "m":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 1000
        case "cm":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 10
        case "mi":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 1609344
        case "Yd":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 914.4
        case "Ft":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 304.8
        case "In":
            konvertovanieNaMilimetre = vstupnaVzdialenost * 25.4
        default:
            konvertovanieNaMilimetre = vstupnaVzdialenost
        }
        
        return konvertovanieNaMilimetre
    }
    
    var body: some View {
        Form{
            Section("Zadaj vstupne jednotky"){
                TextField("Zadaj vzdialenost", value: $vstupnaVzdialenost , format: .number )
                    .keyboardType(.decimalPad)
                
                Picker("Vyber vstupnu jednotku", selection: $vstupnaJednotka) {
                    ForEach(vsetkyJednotky, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
                
                
            }
            
            Section("Metricke") {
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"Km"))
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"cm"))
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"m"))
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"mm"))
            }
            Section("Metricke") {
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"mi"))
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"Yd"))
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"Ft"))
                Text(vypocitajVzdialenost(vzdialenost: vstupnaVzdialenostMM, output:"In"))
            }
        }
        .navigationTitle("Vzdialenost")
    }
    
    func vypocitajVzdialenost(vzdialenost: Double, output: String) -> String {
        var vystup : Double
        switch output {
        case "Km":
            vystup = vzdialenost / 1000000
            
        case "m":
            vystup = vzdialenost / 1000
            
        case "cm":
            vystup = vzdialenost / 10
            
        case "mi":
            vystup = vzdialenost / 1609344
        
        case "Yd":
            vystup = vzdialenost / 914.4
            
        case "Ft":
            vystup = vzdialenost / 304.8
        
        case "In":
            vystup = vzdialenost / 25.4
            
        default:
            vystup = vzdialenost
        }
        
        var textovyVystup = String(format: "%.6f", vystup)
        
        while textovyVystup.last == "0" {
            textovyVystup.removeLast()
        }
        
        if textovyVystup.last == "." {
            textovyVystup.removeLast()
        }
        
        return "\(textovyVystup) \(output)"
    }
}

struct ConvertVzdialenostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertVzdialenostView()
    }
}

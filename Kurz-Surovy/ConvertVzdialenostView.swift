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
                Text("Km")
                Text("m")
                Text("cm")
                Text("mm")
            }
            Section("Metricke") {
                Text("mi")
                Text("Yd")
                Text("Ft")
                Text("In")
            }
        }
        .navigationTitle("Vzdialenost")
    }
}

struct ConvertVzdialenostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertVzdialenostView()
    }
}

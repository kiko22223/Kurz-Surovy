//
//  ConvertDetailView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 11/06/2023.
//

import SwiftUI

struct ConvertDetailView: View {
    let units: Units
    let title: String

    @State private var zadanaHodnota: Double = 1 {
        didSet {
            UserDefaults.standard.set(zadanaHodnota, forKey: title +  Constants.lastUsedValueKey)
        }
    }
    @State private var vstupnaJednotka: String = "janko mrkvicka" {
        didSet{
            UserDefaults.standard.set(vstupnaJednotka, forKey: title + Constants.lastUsedUnitKey)
        }
    }

    var body: some View {
        Form(content: {
            SwiftUI.Section(units.sections[0].title) {
                TextField("Zadaj hodnotu", value: $zadanaHodnota , format: .number )
                    .keyboardType(.decimalPad)
                Picker("Vyber vstupnu jednotku", selection: $vstupnaJednotka) {
                    ForEach(units.units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }

            ForEach(1..<units.sections.count, id: \.self) { index in
                SwiftUI.Section(units.sections[index].title) {
                    ForEach(units.sections[index].units, id: \.self) { unitIndex in
                        Text(units.convert(value: zadanaHodnota,
                                           fromUnit: vstupnaJednotka,
                                           toUnit: units.units[unitIndex])
                        )
                    }
                }
            }
        })
        .navigationTitle(title)
        .task {
            if let lastUsedUnit = UserDefaults.standard.string(forKey: title + Constants.lastUsedUnitKey){
                vstupnaJednotka = lastUsedUnit
            } else {
                let index = units.ratios.firstIndex(of: 1) ?? 0
                vstupnaJednotka = units.units[index]
            }
            zadanaHodnota = UserDefaults.standard.value(forKey: title + Constants.lastUsedValueKey) as? Double ?? 1
            
        }


    }
}
//struct ConvertDetailView_Preview: PreviewProvider {
//    static var previews: some View {
//        ConvertDetailView(units: Units!, title: "Test", vstupnaJednotka: "Km")
//    }
//}

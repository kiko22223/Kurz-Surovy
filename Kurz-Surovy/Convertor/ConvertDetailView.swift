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

    @AppStorage private var zadanaHodnota: Double
    @AppStorage private var vstupnaJednotka: String
    @AppStorage private var numberOfClics: Int
    @Environment(\.presentationMode) var presentation
    


    init(units: Units, title: String) {
        func loadUnit(title: String, units: Units) -> String {
            if let lastUsedUnit = UserDefaults.standard.string(forKey: title + Constants.lastUsedValueKey) {
                return lastUsedUnit
            } else {
                let index = units.ratios.firstIndex(of: 1) ?? 0
                return units.units[index]
            }
        }

        func loadValue(title: String) -> Double {
            UserDefaults.standard.value(forKey: title + Constants.lastUsedUnitKey) as? Double ?? 1
        }
        func loadNumberOfClics(title: String) -> Int {
            UserDefaults.standard.integer(forKey: title + Constants.numberOfClicsKey)
        }
        self._zadanaHodnota = AppStorage(wrappedValue: loadValue(title: title),
                                         title + Constants.lastUsedValueKey)
        self._vstupnaJednotka = AppStorage(wrappedValue: loadUnit(title: title, units: units),
                                           title + Constants.lastUsedUnitKey)
        self._numberOfClics = AppStorage(wrappedValue: loadNumberOfClics(title: title),
                                         title + Constants.numberOfClicsKey)
        self.units = units
        self.title = title
        
    }

    var body: some View {
        Form(content: {
            Text("Number of opens: \(numberOfClics)")
            Button("Delete all views") {
                numberOfClics = 0
                presentation.wrappedValue.dismiss()
            }
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
        .onAppear{
            self.numberOfClics = numberOfClics + 1
        }
    }
}
//struct ConvertDetailView_Preview: PreviewProvider {
//    static var previews: some View {
//        ConvertDetailView(units: Units!, title: "Test", vstupnaJednotka: "Km")
//    }
//}

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

    init(units: Units, title: String, zadanaHodnota: Double, vstupnaJednotka: String) {
        self._zadanaHodnota = AppStorage(wrappedValue: zadanaHodnota, title + Constants.lastUsedValueKey)
        self._vstupnaJednotka = AppStorage(wrappedValue: vstupnaJednotka, title + Constants.lastUsedUnitKey)
        self.units = units
        self.title = title
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
    }
}
//struct ConvertDetailView_Preview: PreviewProvider {
//    static var previews: some View {
//        ConvertDetailView(units: Units!, title: "Test", vstupnaJednotka: "Km")
//    }
//}

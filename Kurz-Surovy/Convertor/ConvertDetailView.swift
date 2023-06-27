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

    @State private var zadanyObjem: Double = 1
    @State var vstupnaJednotka: String

    var body: some View {
        Form(content: {
            SwiftUI.Section(units.sections[0].title) {
                TextField("Zadaj hodnotu", value: $zadanyObjem , format: .number )
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
                        Text(units.convert(value: zadanyObjem,
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

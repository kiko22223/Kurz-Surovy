//
//  ConvertVzdialenostView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 15/05/2023.
//

import SwiftUI

struct ConvertDetailView: View {
    let units: Units
    let title: String

    @State private var value: Double = 1
    @State private var selectedUnit = "cm"
    
    var body: some View {
        Form(content: {
            SwiftUI.Section(units.sections[0].title) {
                TextField("Zadaj hodnotu", value: $value , format: .number )
                    .keyboardType(.decimalPad)
                Picker("Vyber vstupnu jednotku", selection: $selectedUnit) {
                    ForEach(units.units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }

            ForEach(1..<units.sections.count, id: \.self) { index in
                SwiftUI.Section(units.sections[index].title) {
                    ForEach(units.sections[index].units, id: \.self) { unitIndex in
                        Text(units.convert(value: value,
                                           fromUnit: selectedUnit,
                                           toUnit: units.units[unitIndex])
                        )
                    }
                }
            }
        })
        .navigationTitle(title)
    }
    

}

struct ConvertVzdialenostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertDetailView(units: Units(units: ["km", "m", "cm", "mm", "Mi", "Yd", "Ft", "In"],
                                       sections: [Section(title: "Zadajte dĺžku", units: []),
                                                  Section(title: "Metrické", units: [0, 1, 2, 3]),
                                                  Section(title: "Imperiálne", units: [4, 5, 6, 7])],
                                       ratios: [1000, 1, 0.01, 0.001, 1609.344, 0.9144, 0.3048, 0.0254]),
                          title: "Preview")
    }
}

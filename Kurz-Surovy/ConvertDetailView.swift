//
//  ConvertDetailView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 15/05/2023.
//

import SwiftUI

struct ConvertDetailView: View {
    @StateObject var viewModel: ConvertDetailViewModel
    
    var body: some View {
        Form(content: {
            SwiftUI.Section(viewModel.units.sections[0].title) {
                TextField("Zadaj hodnotu", value: $viewModel.value , format: .number )
                    .keyboardType(.decimalPad)
                Picker("Vyber vstupnu jednotku", selection: $viewModel.selectedUnit) {
                    ForEach(viewModel.units.units, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }

            ForEach(1..<viewModel.units.sections.count, id: \.self) { index in
                SwiftUI.Section(viewModel.units.sections[index].title) {
                    List(viewModel.units.sections[index].units, id: \.self) { unitIndex in
                        Text(viewModel.units.convert(value: viewModel.value,
                                                     fromUnit: viewModel.selectedUnit,
                                                     toUnit: viewModel.units.units[unitIndex])
                        )
                    }
                }
            }
        })
        .navigationTitle(viewModel.title)
        .task {
            viewModel.getDefaultValues()
        }
    }
    

}

struct ConvertVzdialenostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertDetailView(viewModel: ConvertDetailViewModel(
            units: Units(units: ["km", "m", "cm", "mm", "Mi", "Yd", "Ft", "In"],
                         sections: [Section(title: "Zadajte dĺžku", units: []),
                                    Section(title: "Metrické", units: [0, 1, 2, 3]),
                                    Section(title: "Imperiálne", units: [4, 5, 6, 7])],
                         ratios: [1000, 1, 0.01, 0.001, 1609.344, 0.9144, 0.3048, 0.0254]),
            title: "Preview")
        )
    }
}

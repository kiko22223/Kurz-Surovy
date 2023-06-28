//
//  ContentView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 14/05/2023.
//

import SwiftUI

struct ConvertMenuView: View {

    let cells: [LinkViewDescription]
    
    var body: some View {
        NavigationView {
            ScrollView{
                ForEach(Array(cells.enumerated()), id: \.offset) { _, cell in
                    NavigationLink {
                        ConvertDetailView(viewModel: ConvertDetailViewModel(units: cell.units,
                                                                            title: cell.title))
                    } label: {
                        LinkView(topColor: cell.topColor,
                                 bottomColor: cell.bottomColor,
                                 headerTitle: cell.title,
                                 titleImage: cell.imageName)
                    }.navigationTitle("Konvertor")
                }
            }
        }
        .navigationViewStyle(.stack)
        
    }
}

struct ConvertMenuViewPreview: PreviewProvider {
    static var previews: some View {
        ConvertMenuView(cells: [LinkViewDescription(title: "Lenght",
                                                    imageName: "imageKM",
                                                    topColor: .blue, bottomColor: .cyan,
                                                    units: Units(units: ["km", "m", "cm", "mm", "Mi", "Yd", "Ft", "In"],
                                                                 sections: [Section(title: "Zadajte dĺžku", units: []),
                                                                            Section(title: "Metrické",
                                                                                    units: [0, 1, 2, 3]),
                                                                            Section(title: "Imperiálne",
                                                                                    units: [4, 5, 6, 7])],
                                                                 ratios: [1000, 1, 0.01, 0.001, 1609.344,
                                                                          0.9144, 0.3048, 0.0254]))])
    }
}

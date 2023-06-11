//
//  Kurz_SurovyApp.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 14/05/2023.
//

import SwiftUI

@main
struct Kurz_SurovyApp: App {
    var body: some Scene {
        WindowGroup {
            ConvertMenuView(cells: [
                LinkViewDescription(title: "Lenght",
                                    imageName: "imageKM",
                                    topColor: .blue, bottomColor: .cyan,
                                    units: Units(units: ["km", "m", "cm", "mm", "Mi", "Yd", "Ft", "In"],
                                                 sections: [Section(title: "Zadajte dĺžku", units: []),
                                                            Section(title: "Metrické", units: [0, 1, 2, 3]),
                                                            Section(title: "Imperiálne", units: [4, 5, 6, 7])],
                                                 ratios: [1000, 1, 0.01, 0.001, 1609.344, 0.9144, 0.3048, 0.0254])),
                LinkViewDescription(title: "Volume",
                                    imageName: "imageML",
                                    topColor: .orange, bottomColor: .yellow,
                                    units: Units(units: ["l", "ml", "cup", "pt", "gl"],
                                                 sections: [Section(title: "Zadajte objem", units: []),
                                                            Section(title: "Metrické", units: [0, 1]),
                                                            Section(title: "Imperiálne", units: [2, 3, 4])],
                                                 ratios: [1000, 1, 236.588237, 473.176473, 3785.41178])),
                LinkViewDescription(title: "Weight",
                                    imageName: "imageKG",
                                    topColor: .red, bottomColor: .blue,
                                    units: Units(units: ["mg", "g", "dk", "kg", "q", "T"],
                                                 sections: [Section(title: "Zadajte hmotnosť", units: []),
                                                            Section(title: "Metrické", units: [0, 1, 2, 3,]),
                                                            Section(title: "Imperiálne", units: [4, 5])],
                                                 ratios: [10e-6, 0.001, 0.01, 1, 100, 1000])),
                LinkViewDescription(title: "Energy",
                                    imageName: "imageC",
                                    topColor: .blue, bottomColor: .purple,
                                    units: Units(units: ["J", "Nm", "mJ", "kJ", "MJ", "GJ", "TJ"],
                                                 sections: [Section(title: "Zadajte teplo", units: []),
                                                            Section(title: "Teplo", units: [0, 1, 2, 3, 4, 5, 6])],
                                                 ratios: [1, 1, 0.001, 1000, 10e6, 10e9, 10e12]))
            ])
        }
    }
}

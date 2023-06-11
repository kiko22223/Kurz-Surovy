//
//  ContentView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 14/05/2023.
//

import SwiftUI

struct ContentView: View {
    let pozdrav = "Hello, World!"
    let  pii = Float.pi
    
    var body: some View {
        NavigationView {
            ScrollView{
                NavigationLink {
                    ConvertVzdialenostView()
                } label: {
                    LinkView(topColor: .blue, bottomColor: .cyan, headerTitle: "Vzdialenost", titleImage: "imageKM", units: Units(units: ["km", "m", "cm", "mm", "Mi", "Yd", "Ft", "In"],
                                                                                                                           sections: [Section(title: "Zadajte dĺžku", units: []),
                                                                                                                                      Section(title: "Metrické", units: [0, 1, 2, 3]),
                                                                                                                                      Section(title: "Imperiálne", units: [4, 5, 6, 7])],
                                                                                                                           ratios: [1000, 1, 0.01, 0.001, 1609.344, 0.9144, 0.3048, 0.0254]))
                }
                NavigationLink {
                    ConvertObjem()
                } label: {
                    LinkView(topColor: .orange, bottomColor: .yellow, headerTitle: "Objem", titleImage: "imageML", units: Units(units: ["l", "ml", "cup", "pt", "gl"],
                                                                                                                         sections: [Section(title: "Zadajte objem", units: []),
                                                                                                                                    Section(title: "Metrické", units: [0, 1]),
                                                                                                                                    Section(title: "Imperiálne", units: [2, 3, 4])],
                                                                                                                         ratios: [1000, 1, 236.588237, 473.176473, 3785.41178]))
                }
                NavigationLink {
                    ConvertHmotnostView()
                } label: {
                    LinkView(topColor: .green, bottomColor: .blue, headerTitle: "Hmotnost", titleImage: "imageKG", units: Units(units: ["mg", "g", "dk", "kg", "q", "T"],
                                                                                                                                sections: [Section(title: "Zadajte hmotnosť", units: []),
                                                                                                                                           Section(title: "Metrické", units: [0, 1, 2, 3,]),
                                                                                                                                           Section(title: "Imperiálne", units: [4, 5])],
                                                                                                                                ratios: [10e-6, 0.001, 0.01, 1, 100, 1000]))
                }
                NavigationLink {
                    ConvertTeplotaView()
                } label: {
                    LinkView(topColor: .red, bottomColor: .gray, headerTitle: "Teplota", titleImage: "imageC", units: Units(units: ["J", "Nm", "mJ", "kJ", "MJ", "GJ", "TJ"],
                                                                                                                            sections: [Section(title: "Zadajte teplo", units: []),
                                                                                                                                       Section(title: "Teplo", units: [0, 1, 2, 3, 4, 5, 6])],
                                                                                                                            ratios: [1, 1, 0.001, 1000, 10e6, 10e9, 10e12]))
                }
                
                .navigationTitle("Konvertor")
            }
        
        }
        .navigationViewStyle(.stack)
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

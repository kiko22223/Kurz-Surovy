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
                    LinkView(topColor: .blue, bottomColor: .cyan, headerTitle: "Vzdialenost", titleImage: "image")
                }
                NavigationLink {
                    ConvertObjem()
                } label: {
                    LinkView(topColor: .orange, bottomColor: .yellow, headerTitle: "Objem", titleImage: "image")
                }
                .navigationTitle("Konvertor")
            }
        
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

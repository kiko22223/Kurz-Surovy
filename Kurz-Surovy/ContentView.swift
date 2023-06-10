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
                    LinkView(topColor: .blue, bottomColor: .cyan, headerTitle: "Vzdialenost", titleImage: "imageKM")
                }
                NavigationLink {
                    ConvertObjem()
                } label: {
                    LinkView(topColor: .orange, bottomColor: .yellow, headerTitle: "Objem", titleImage: "imageML")
                }
                NavigationLink {
                    ConvertHmotnostView()
                } label: {
                    LinkView(topColor: .green, bottomColor: .blue, headerTitle: "Hmotnost", titleImage: "imageKG")
                }
                NavigationLink {
                    ConvertTeplotaView()
                } label: {
                    LinkView(topColor: .red, bottomColor: .gray, headerTitle: "Teplota", titleImage: "imageC")
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

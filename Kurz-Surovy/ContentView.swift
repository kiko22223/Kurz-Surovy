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
            List{
                NavigationLink("Vzdialenost", destination: ConvertVzdialenostView())
                NavigationLink("Objem", destination: ConvertObjem())
            } .navigationTitle("Konvertor")
        
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

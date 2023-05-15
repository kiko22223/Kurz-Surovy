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
        VStack {
            SingleTextView(popis: "Prvy", farba: .blue)
            SingleTextView(popis: "Druhy", farba: .green)
            SingleTextView(popis: "Treti")
                
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

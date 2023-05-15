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
        ScrollView {
            Group{
                Text("\(pii)")
                    .font(.largeTitle)
                    .bold()
                
                Text(pozdrav)
                
            }
       
        }
        .frame(maxWidth: .infinity)
        .padding(40)
        .background(.red)
        .cornerRadius(20)
        .padding(20)
        
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 30/06/2023.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ScrollView {
            NavigationLink {
                ConvertMenuView()
            } label: {
                Text("Konvertor").font(.largeTitle).foregroundColor(.green).padding(.vertical, 20.0)
            }.navigationTitle("Rozcestnik")

            NavigationLink {
                SplitBillView()
            } label: {
                Text("Split Bill").font(.largeTitle).foregroundColor(.green).padding(.vertical, 20.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

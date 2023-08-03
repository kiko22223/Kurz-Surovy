//
//  Splitter.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 03/07/2023.
//

import SwiftUI

struct SplitterView: View {
    
    var body: some View {
        
        
        ScrollView{
            NavigationLink {
                ConvertMenuView()
            } label: {
                
            }
            NavigationLink {
                SplitBillView()
            } label: {
                
            }
            NavigationLink {
                Encode()
            } label: {
                
            }
            NavigationLink {
                Decode()
            } label: {
                
            }
            .navigationTitle("Way to all apps")
        }
    }
    LinkView(topColor: .red, bottomColor: .blue, headerTitle: "Convertor", systemImageName: "clock.arrow.circlepath")
    LinkView(topColor: .green, bottomColor: .yellow, headerTitle: "Encode" , systemImageName: "wallet.pass")
    LinkView(topColor: .yellow, bottomColor: .purple, headerTitle: "SplitBill" , systemImageName: "person.2.fill")
    LinkView(topColor: .yellow, bottomColor: .green, headerTitle: "Decode" , systemImageName: "wallet.pass.fill")
}

struct Splitter_Previews: PreviewProvider {
    static var previews: some View {
        SplitterView()
    }
}

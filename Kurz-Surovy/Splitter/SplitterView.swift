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
                    LinkView(topColor: .red, bottomColor: .blue, headerTitle: "Convertor", systemImageName: "clock.arrow.circlepath")
                }
                NavigationLink {
                    SplitBillView()
                } label: {
                    LinkView(topColor: .yellow, bottomColor: .purple, headerTitle: "SplitBill" , systemImageName: "person.2.fill")
                }
                NavigationLink {
                    SplitBillView()
                } label: {
                    LinkView(topColor: .green, bottomColor: .yellow, headerTitle: "Encode" , systemImageName: "wallet.pass")
                }
                NavigationLink {
                    SplitBillView()
                } label: {
                    LinkView(topColor: .yellow, bottomColor: .green, headerTitle: "Decode" , systemImageName: "wallet.pass.fill")
                }
                .navigationTitle("Way to all apps")
            }
        }
       
        
    }

struct Splitter_Previews: PreviewProvider {
    static var previews: some View {
        SplitterView()
    }
}

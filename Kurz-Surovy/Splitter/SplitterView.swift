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
                .navigationTitle("Way to all apps")
            }
        }
       
        
    }

struct Splitter_Previews: PreviewProvider {
    static var previews: some View {
        SplitterView()
    }
}

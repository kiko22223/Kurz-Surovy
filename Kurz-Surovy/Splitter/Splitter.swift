//
//  Splitter.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 03/07/2023.
//

import SwiftUI

struct Splitter: View {
    
    let spliiterIntro: [SplitterCells] = [SplitterCells(name: "Convertor", color: Color.red), SplitterCells(name: "SplitBill", color: .black)]
    
    var body: some View {
        NavigationView {
            //            ForEach(Array(spliiterIntro.enumerated()), id: \.offset) { _, cell in
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
        
    }
//}

struct Splitter_Previews: PreviewProvider {
    static var previews: some View {
        Splitter()
    }
}

//            Form{
//
//                NavigationLink("ConvertMenuView"){
//                    ConvertMenuView()
//                }
//                NavigationLink("SplitBillView"){
//                    SplitBillView()
//                }
//
//            }
//            navigationTitle("All your apps")
// Ako nastavit aby tam nebol odsek ? Ako by som dokazal spravit model ktory by si tahal aj destination aj data o vizualnom dizajne z modelu ? 

//
//  Splitter.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 03/07/2023.
//

import SwiftUI



struct SplitterView: View {
    
    let views : [(view: AnyView, topColor: Color, bottomColor: Color, headerTitle: String, systemImageName: String)] = [
        (view: AnyView(ConvertMenuView()), topColor: .red, bottomColor: .blue, headerTitle: "Convertor", systemImageName: "clock.arrow.circlepath"),
        (view: AnyView(SplitBillView()), topColor: .green, bottomColor: .yellow, headerTitle: "SplitBill" , systemImageName: "wallet.pass"),
        (view: AnyView(EncodeView()), topColor: .yellow, bottomColor: .purple, headerTitle: "Encode" , systemImageName: "person.2.fill"),
        (view: AnyView(DecodeView()), topColor: .yellow, bottomColor: .green, headerTitle: "Decode" , systemImageName: "wallet.pass.fill")
    ]
    
    var body: some View {
        
        
        ScrollView{
            ForEach(views, id: \.headerTitle){ view in
                NavigationLink {
                    view.view
                } label: {
                    LinkView(topColor: view.topColor, bottomColor: view.bottomColor, headerTitle: view.headerTitle, systemImageName: view.systemImageName)
                }
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

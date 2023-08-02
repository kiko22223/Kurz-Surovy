//
//  Splitter.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 03/07/2023.
//

import SwiftUI

struct LinkDescription {
    let view: AnyView
    let title: String
    let systemImage: String
    let topColor: Color
    let bottomColor: Color
}

struct SplitterView: View {

    let viewDescriptions = [
        LinkDescription(view: AnyView(ConvertMenuView()), title: "Convertor", systemImage: "clock.arrow.circlepath", topColor: .red, bottomColor: .blue),
        LinkDescription(view: AnyView(SplitBillView()), title: "SplitBill", systemImage: "person.2.fill", topColor: .yellow, bottomColor: .purple),
        LinkDescription(view: AnyView(Encode()), title: "Encode", systemImage: "wallet.pass", topColor: .green, bottomColor: .yellow),
        LinkDescription(view: AnyView(SplitBillView()), title: "Decode", systemImage: "wallet.pass.fill", topColor: .yellow, bottomColor: .green)
    ]
    
    var body: some View {

        ScrollView{
            ForEach(viewDescriptions, id: \.title) { viewDescription in
                NavigationLink {
                    viewDescription.view
                } label: {
                    LinkView(topColor: viewDescription.topColor,
                             bottomColor: viewDescription.bottomColor,
                             headerTitle: viewDescription.title,
                             systemImageName: viewDescription.systemImage)
                }
            }.navigationTitle("Way to all apps")
        }

    }
    
}

struct Splitter_Previews: PreviewProvider {
    static var previews: some View {
        SplitterView()
    }
}

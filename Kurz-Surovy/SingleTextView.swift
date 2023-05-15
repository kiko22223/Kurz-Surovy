//
//  SingleTextView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 15/05/2023.
//

import SwiftUI

struct SingleTextView: View {
    let popis: String
    var farba: Color = .red
    
    var body: some View {
        Text(popis)
            .frame(maxWidth: .infinity)
            .padding(40)
            .background(farba)
            .cornerRadius(20)
            .padding(20)
    }
}

struct SingleTextView_Previews: PreviewProvider {
    static var previews: some View {
        SingleTextView(popis: "ahoj svet")
    }
}

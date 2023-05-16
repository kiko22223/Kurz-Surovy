//
//  ConvertHmotnostView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 16/05/2023.
//

import SwiftUI

struct ConvertHmotnostView: View {
    
    @State private var vstupnaHmotsnost: Double = 0
    
    var body: some View {
        Form{
            
            
            Section("Zadajte hmotnost"){
                TextField("Zadaj vstupnu hmotnost", value: $vstupnaHmotsnost, format: .number)
            }
        }
        .navigationTitle("Hmotnost")
    }
        
}

struct ConvertHmotnostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertHmotnostView()
    }
}

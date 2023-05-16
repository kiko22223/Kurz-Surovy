//
//  LinkView.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 16/05/2023.
//

import SwiftUI

struct LinkView: View {
    
    let topColor : Color
    let bottomColor: Color
    let headerTitle: String
    let titleImage: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(7)
            VStack{
                
                HStack{
                    Text(headerTitle)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(30)
                        .opacity(0.8)
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .frame(height: 150)
        .padding(7)
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(topColor: .red, bottomColor: .orange, headerTitle: "Titulok", titleImage: "image")
    }
}

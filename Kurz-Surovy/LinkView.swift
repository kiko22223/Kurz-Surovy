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
    let units: Units
    
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
                Image(titleImage)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .opacity(0.7)
                    .offset(x:100, y: 0)
                
            }
        }
        .frame(height: 150)
        .padding(7)
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(topColor: .red, bottomColor: .orange, headerTitle: "Titulok", titleImage: "imageKM", units: Units(units: ["Unit1", "Unit2", "Unit3"], sections: [Section(title: "NameOfSection", units: [1, 2, 3])], ratios: [0.2, 3.2, 5.3]))
    }
}

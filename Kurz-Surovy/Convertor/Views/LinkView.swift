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
    var titleImage: String? = nil
    var systemImageName: String? = nil
    
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
                if let systemImageName {
                    Image(systemName: systemImageName)
                        .resizable()
                        .frame(width: 60, height: 50)
                        .opacity(0.7)
                        .offset(x:100, y: 0)
                        .tint(.white)
                } else if let titleImage {
                    Image(titleImage)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .opacity(0.7)
                        .offset(x:100, y: 0)
                }
            }
        }
        .frame(height: 150)
        .padding(7)
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(topColor: .red, bottomColor: .orange, headerTitle: "Titulok", titleImage: "imageKM")
    }
}

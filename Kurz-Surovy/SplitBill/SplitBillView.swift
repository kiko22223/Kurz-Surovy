
//  SplitBill.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 27/06/2023.

import SwiftUI

struct SplitBillView: View {
    @State var amountOfPeople = 1.0
    @State var amountToPay = 0.0

    var body: some View {
        Form(content: {
            SwiftUI.Section("Enter amount to pay"){
                Text("Enter amount of bill")
                TextField("How much of you together payed", value: $amountToPay, format: .number)
                    .keyboardType(.decimalPad)
            }
            SwiftUI.Section("Split your bill"){
                Text("Choose amount of people")
                TextField("How much of you were together", value: $amountOfPeople, format: .number)
                    .keyboardType(.decimalPad)

            }
            SwiftUI.Section("Final cost"){
                Text("\(amountToPay / amountOfPeople)")
                    .font(.largeTitle)
            }
        })
    }
}

struct SplitBill_Previews: PreviewProvider {
    static var previews: some View {
        SplitBillView()
    }
}

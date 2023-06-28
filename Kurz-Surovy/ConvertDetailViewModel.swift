//
//  ConvertDetailViewModel.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 28/06/2023.
//

import SwiftUI

class ConvertDetailViewModel: ObservableObject {
    let units: Units
    let title: String

    @Published var selectedUnit: String = "" {
        didSet {
            UserDefaults.standard.set(selectedUnit, forKey: titleWith(key: Constants.lastUnitKey))
        }
    }
    @Published var value: Double = 1 {
        didSet {
            UserDefaults.standard.set(value, forKey: titleWith(key: Constants.lastValueKey))
        }
    }

    init(units: Units, title: String) {
        self.units = units
        self.title = title
    }

    func getDefaultValues() {
        if let unit = UserDefaults.standard.string(forKey: titleWith(key: Constants.lastUnitKey)) {
            selectedUnit = unit
        } else {
            let index = units.ratios.firstIndex(of: 1) ?? 0
            selectedUnit = units.units[index]
        }
        value = UserDefaults.standard.value(forKey: titleWith(key: Constants.lastValueKey)) as? Double ?? 1
    }

    private func titleWith(key: String) -> String {
        return key + title
    }
}

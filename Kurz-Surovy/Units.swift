//
//  TableViewDescription.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 10/06/2023.
//

import Foundation
struct Units {
    var units : [String]
    var sections : [Section]
    var ratios : [Double]
    
    func convert(value: Double, fromUnit: String, toUnit: String) -> String {
        guard let fromIndex = units.firstIndex(of: fromUnit),
              let toIndex = units.firstIndex(of: toUnit),
              ratios.indices.contains(fromIndex),
              ratios.indices.contains(toIndex) else { return "" }
        let basicValue = value * ratios[fromIndex]
        let toValue = basicValue / ratios[toIndex]
        return "\(toValue) \(toUnit)"
    }
    
}

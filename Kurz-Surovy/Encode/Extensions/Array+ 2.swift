//
//  Array+.swift
//  Kurz-Surovy
//
//  Created by Christian Marušák on 28/08/2023.
//

import Foundation
extension Array {
    subscript (safe index:Index) -> Element?{
        return indices.contains(index) ? self[index] : nil
    }
}

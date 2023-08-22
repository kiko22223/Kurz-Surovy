//
//  Codable+.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 22/08/2023.
//

import Foundation

extension Decodable {
    static func load(key: String) -> Self? {
        if let data = UserDefaults.standard.object(forKey: key) as? Data {
            return try? JSONDecoder().decode(Self.self, from: data)
        }
        return nil
    }
}

extension Encodable {
    func save(key: String) {
        if let data = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

//
//  CodeSettings.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 22/08/2023.
//

struct CodeSettings: Codable {
    var alphabet = "aáäbcčdďdzdžeéfghchiíjklĺľmnňoóôpqrŕsštťuúvwxyýzž1234567890?!"
    var numberOfIterations = 3
    var offsets = [0,0,0]
    var profiles = ["default","blablabla"]
}


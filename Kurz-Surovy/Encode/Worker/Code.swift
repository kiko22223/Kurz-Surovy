//
//  Code.swift
//  Kurz-Surovy
//
//  Created by Radovan Bojkovský on 22/08/2023.
//

class Code {
    
    private(set) var settings: CodeSettings
    
    init(settings: CodeSettings) {
        self.settings = settings
    }
    
    var count : Int {
        return settings.alphabet.count
    }
    func moveAlphabet(with _offset: Int) -> String {
        //    let offset = offset > alphabet.count - 1 ? offset % alphabet.count : offset
        var offset = abs(_offset)
        if _offset > count - 1 {
            offset = _offset % count
        } else {
            offset = _offset
        }
        
        if offset == 0 {
            return settings.alphabet
        }
        let tail = settings.alphabet.suffix(offset)
        return tail + String(settings.alphabet.dropLast(offset))
    }
    
    func movedIndex(position: Int, with offset: Int) -> Int {
        let absOffset = abs(offset)
        let offset = absOffset > count - 1 ? absOffset % count : absOffset
        if offset == 0 {
            return position
        }
        let sum = position + offset
        return sum < count ? sum : sum % count
    }
}

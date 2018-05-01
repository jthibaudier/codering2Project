//
//  Codering.swift
//  App
//
//  Created by Joop Thibaudier on 28/04/2018.
//

import Foundation

class Codering {
    private let alfabet = "abcdefghijklmnopqrstuvwxyz"
    
    static func converteer(sleutel: Int, ongecodeerd: String) -> String {
        let ongecodeerd = ongecodeerd.lowercased()
        let zonderspaties = ongecodeerd.replacingOccurrences(of: " ", with: "")
        var i = 0;
        var resultaat = ""
        
        print("Ongecodeerd is nu: \(zonderspaties)")
        
        
        for character in zonderspaties {
            i = i + 1
            let newChar = shiftLetter(character: character, aantal: sleutel)
            resultaat = resultaat + String(newChar)
            
            if (i % 5 == 0) {
                resultaat = resultaat + " "
            }
        }
        
        print("Resultaat: \(resultaat)")
        return resultaat;
    }
    
    private static func shiftLetter(character: Character, aantal: Int) -> Character {
        // value maken van huidige character
        let value = character.unicodeScalarCodePoint()
        
        let a: Character = "a"
        let aValue = a.unicodeScalarCodePoint()
        
        var getal = (aantal % 26 + Int(value))
        if (getal < aValue) {
            getal = getal + 26
        }
                
        let u = UnicodeScalar(UInt32(getal))
        let char = Character(u!)
        
        return char
    }
}

extension Character {
    func unicodeScalarCodePoint() -> UInt32 {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex].value
    }
}


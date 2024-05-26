//
//  Morse.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 26/05/24.
//

import Foundation

class Morse : ObservableObject {
    
    @Published var morseCodeDict: [String: String] = [
        "A": ".-",
        "B": "-...",
        "C": "-.-.",
        "D": "-..",
        "E": ".",
        "F": "..-.",
        "G": "--.",
        "H": "....",
        "I": "..",
        "J": ".---",
        "K": "-.-",
        "L": ".-..",
        "M": "--",
        "N": "-.",
        "O": "---",
        "P": ".--.",
        "Q": "--.-",
        "R": ".-.",
        "S": "...",
        "T": "-",
        "U": "..-",
        "V": "...-",
        "W": ".--",
        "X": "-..-",
        "Y": "-.--",
        "Z": "--.."
    ]
    
    // masukin letter dan dapet morse code
    func getMorseCode(for letter: String) -> String? {
        return morseCodeDict[letter.uppercased()]
    }
    
    
    // dapet letter kalo masukin morse code
    private var reverseMorseCodeDict: [String: String] = [:]
    
    init() {
        // reverse lookup dictionary
        for(letter, code) in morseCodeDict {
            reverseMorseCodeDict[code] = letter
        }
    }
    
    func getLetter(for morseCode: String) -> String? {
        return reverseMorseCodeDict[morseCode]
    }
    
}

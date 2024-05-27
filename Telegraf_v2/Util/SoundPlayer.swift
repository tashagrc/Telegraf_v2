//
//  SoundPlayer.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 27/05/24.
//

import Foundation
import AVFoundation

class SoundPlayer {
    var audioPlayer: AVAudioPlayer?
    
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not play the sound file.")
            }
        }
    }
    
    // play the morse code
    
    func playMorseCode(_ code: String) {
        let morseCharacters = Array(code)
        playNextCharacter(morseCharacters)
    }

    private func playNextCharacter(_ characters: [Character]) {
        guard !characters.isEmpty else { return }

        var characters = characters
        let character = characters.removeFirst()

        let delay: TimeInterval
        switch character {
        case ".":
            playSound(sound: "dot", type: "mp3")
            delay = 0.2
        case "-":
            playSound(sound: "dash", type: "mp3")
            delay = 0.6
        case " ":
            delay = 0.2 // Short delay for space between letters
        case "|":
            delay = 1.0 // Long delay for space between words
        default:
            delay = 0.0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.playNextCharacter(characters)
        }
    }
}

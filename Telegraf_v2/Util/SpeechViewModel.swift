//
//  SpeechViewModel.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 27/05/24.
//

import AVFoundation
import SwiftUI

class SpeechViewModel: ObservableObject {
    private var speechSynthesizer = AVSpeechSynthesizer()

    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(utterance)
    }
}



//
//  TransmitterView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 23/05/24.
//

import SwiftUI

struct TransmitterView : View {
    @EnvironmentObject var rpsSession: TelegrafMultipeerSession
    @Binding var morseCode: String
    @Binding var morseLetter: String
    @Binding var lastSwipeDownTime: Date?
    @Binding var swipeDownCount: Int
    
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .frame(width: 700, height: 400)
                    .foregroundColor(Color("Gray"))
                    .cornerRadius(20)
                    .gesture(
                        TapGesture().onEnded {
                            soundPlayer.playSound(sound: "dot", type: "mp3")
                            morseLetter.append(".")
                        }
                    )
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .onEnded { value in
                                let horizontalAmount = value.translation.width
                                let verticalAmount = value.translation.height
                                
                                // tentuin dia swipe vertical atau horizontal
                                if abs(horizontalAmount) > abs(verticalAmount) {
                                    if horizontalAmount > 0 {
                                        // swipe right
                                        soundPlayer.playSound(sound: "dash", type: "mp3")
                                        morseLetter.append("-")
                                    } else {
                                        // swipe left delete 1 karakter di morse letter
                                        if !morseLetter.isEmpty {
                                            morseLetter.removeLast()
                                            print("char remove " + morseLetter)
                                        } else if !morseCode.isEmpty {
                                            
                                            // kalo ga lagi nulis karakter, langsung delete 1 huruf
                                            morseCode = removeLastMorseLetter(morseCode: morseCode)
                                            print("letter remove " + morseCode)
                                        }
                                    }
                                } else { // swipe vertical
                                    if verticalAmount > 0 {
                                        handleSwipeDown()
                                    }
                                    else {
                                        // send to other device
                                        rpsSession.send(message: morseCode)
                                        
                                    
                                        // reset screen
                                        morseLetter = ""
                                        morseCode = ""
                                        print("message sended")
                                        
                                        // show it on receiver view
                                        
                                    }
                                }
                                
                            }
                    )
                
                
                VStack(alignment: .leading) {
                    Text(morseCode)
                        .font(.custom(FontName.regular_light.rawValue, size: 36))
                        .foregroundStyle(Color("Cream"))
                        .padding(10).padding(.leading, 20)
                        .frame(maxWidth: 600, alignment: .leading)
                }
                .frame(width: 700, height: 400, alignment: .topLeading)
                .padding(.top, 10)
            }
            
            
        }
    }
    
    
    func removeLastMorseLetter(morseCode: String) -> String {
        if let lastSpaceIndex = morseCode.dropLast().lastIndex(of: " ") {
            // substring sebelum space, ga termasuk space
            let substring = morseCode[..<lastSpaceIndex]
            // tambahin space agar langsung bisa mulai huruf berikutnya
            return String(substring) + " "
        }
        else { // kalo cuma ada 1 huruf
            return ""
        }
    }
    
    func handleSwipeDown() {
        let now = Date()
        
        // kalo swipe 2 kali
        if let lastTime = lastSwipeDownTime, now.timeIntervalSince(lastTime) < 0.8 {
            swipeDownCount += 1
        } else { // kalo swipe 1 kali
            swipeDownCount = 1
        }
        
        lastSwipeDownTime = now
        
        // kalo swipe 2 kali
        if swipeDownCount == 2 {
            if !morseCode.isEmpty {
                morseCode += "|"
            }
            
            swipeDownCount = 0
            print("swipe 2 kali")
        } else { // kalo swipe 1 kali
            morseCode += morseLetter + " "
            morseLetter = ""
        }
    }
    
}


struct TransmitterView_Previews: PreviewProvider {
    static var previews: some View {
        TransmitterView(
            morseCode: .constant("Sample Morse Code"),
            morseLetter: .constant("Sample Morse Letter"),
            lastSwipeDownTime: .constant(nil),
            swipeDownCount: .constant(0)
        )
        .environmentObject(TelegrafMultipeerSession(username: "nata"))
    }
}

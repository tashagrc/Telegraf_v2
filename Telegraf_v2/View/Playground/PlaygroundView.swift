//
//  PlaygroundView.swift
//  Telegraf
//
//  Created by Natasha Radika on 19/05/24.
//

import SwiftUI

struct PlaygroundView: View {
    // multipeer
    @EnvironmentObject var rpsSession: TelegrafMultipeerSession
    
    // morse code
    @State private var morseCode: String = ""
    @State private var morseLetter:String = ""
    
    // tentuin swipe downnya sekali atau 2 kali
    @State private var lastSwipeDownTime: Date? = nil
    @State private var swipeDownCount: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                ReceiverView()
                TransmitterView(morseCode: $morseCode, morseLetter: $morseLetter, lastSwipeDownTime: $lastSwipeDownTime, swipeDownCount: $swipeDownCount)
                Button {
                    morseCode = ".-- .... .- - | .... .- - .... | --. --- -.. | .-- .-. --- ..- --. .... - ..--.."
                } label: {
                    Text("Write something for me")
                        .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_regtext.rawValue))
                        .foregroundStyle(Color("Cream"))
                        .underline()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("Black").ignoresSafeArea()
            }
            .toolbar {
                // menu
                ToolbarItem(placement: .topBarLeading) {
                        VStack {
                            Text("Playground")
                                .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                                .foregroundColor(Color("Cream"))
                        }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        NavigationLink(destination: GestureRecapView()) {
                            Label("Gestures Recap", systemImage: "hand.tap")
                        }
                        
                        NavigationLink(destination: MorseGuideView()) {
                            Label("Morse Guide", systemImage: "book")
                        }
                        
                        
                        NavigationLink(destination: LandingView()) {
                            Label("Repeat Onboarding", systemImage: "restart.circle")
                        }
                        
                        Button {
                            rpsSession.session.disconnect()
                        } label: {
                            Label("Disconnect Session", systemImage: "rectangle.portrait.and.arrow.forward")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(Color("Cream"))
                            .font(.system(size: 22))
                    }
                }
                
            }
        }.navigationBarBackButtonHidden(true).accentColor(.white)
        
        
        
    }
    
}

#Preview {
    PlaygroundView()
}




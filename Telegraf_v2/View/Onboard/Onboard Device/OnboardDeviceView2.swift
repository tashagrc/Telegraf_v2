//
//  OnboardDeviceView2.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 26/05/24.
//

import SwiftUI

struct OnboardDeviceView2: View {
    @StateObject private var speech = SpeechViewModel()
    var body: some View {
        ZStack {
            Color("Black")
                .ignoresSafeArea()
            
            VStack(spacing: 300) {
                HStack {
                    Spacer()
                    NavigationLink(destination: StartView(), label: {
                        LinkView(linkText: "Skip onboarding", colorText: "LightGray")
                    })
                }.padding(.trailing, 20)
                
                VStack(spacing: 50) {
                    Image("morse").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    // combine 2 text in one
                    HStack {
                        Text("Send and receive messages using ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream")) + Text("Morse Code.")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Red"))
                    }
                    .frame(maxWidth: 450)
                        .multilineTextAlignment(.center)
                    
                }
                
                
                NavigationLink(destination: OnboardDeviceView3(), label: {
                    ButtonView(buttonText: "Next")
                })
            }
            .padding()
        }
        .onAppear {
            let textToSpeak = "Send and receive messages using Morse Code."
            speech.speak(textToSpeak)
        }
    }
}

#Preview {
    OnboardDeviceView2()
}

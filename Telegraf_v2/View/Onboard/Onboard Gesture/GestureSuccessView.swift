//
//  GestureSuccessView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 25/05/24.
//

import SwiftUI

struct GestureSuccessView: View {
    @StateObject private var speech = SpeechViewModel()
    var body: some View {
        ZStack {
            Color("Black")
                .ignoresSafeArea()
            
            VStack(spacing: 250) {
                HStack {
                    Spacer()
                    NavigationLink(destination: StartView(), label: {
                        LinkView(linkText: "Skip onboarding", colorText: "LightGray")
                    })
                }.padding(.trailing, 20)
                
                VStack(spacing: 80) {
                    
                    // combine 2 text in one
                    Text("Well done! \nYou just wrote an .-")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream"))
                            .frame(maxWidth: 450)
                            .multilineTextAlignment(.center)
                    Text("A")
                        .font(.custom(FontName.regular_bold.rawValue, size: FontSize.size_superbigtext.rawValue))
                            .foregroundColor(Color("Red"))
                            .multilineTextAlignment(.center)
                    
                }
                
                
                NavigationLink(destination: FinishOnboardView(), label: {
                    ButtonView(buttonText: "Learn Morse Code")
                })
            }
            .padding()
        }
        .onAppear {
            let textToSpeak = "Well done! You just wrote an A."
            speech.speak(textToSpeak)
        }
    }
}

#Preview {
    GestureSuccessView()
}

//
//  GestureStartView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 25/05/24.
//

import SwiftUI

struct GestureStartView: View {
    var body: some View {
        ZStack {
            Color("Black")
                .ignoresSafeArea()
            
            VStack(spacing: 200) {
                HStack {
                    Spacer()
                    NavigationLink(destination: StartView(), label: {
                        LinkView(linkText: "Skip onboarding", colorText: "LightGray")
                    })
                }.padding(.trailing, 20)
                
                VStack(spacing: 100) {
                    
                    // combine 2 text in one
                    HStack {
                        Text("Telegraphs use Morse code for messaging.\n\n To write Morse code, simply use ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream")) +
                        Text("gestures!")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Red"))
                    }
                    .frame(maxWidth: 450)
                    Image("fingerprint").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                }
                
                
                NavigationLink(destination: GestureSuccessView(), label: {
                    ButtonView(buttonText: "Learn Gesture")
                })
            }
            .padding()
        }
    }
}

#Preview {
    GestureStartView()
}

//
//  OnboardDeviceView2.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 26/05/24.
//

import SwiftUI

struct OnboardDeviceView3: View {
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
                    Image("device_connect").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    // combine 2 text in one
                    HStack {
                        Text("Chat seamlessly over ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream")) +
                        Text("Wi-Fi or Bluetooth ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Red")) +
                        Text("when devices are nearby.")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream"))
                    }
                    .frame(maxWidth: 450)
                        .multilineTextAlignment(.center)
                    
                }
                
                
                NavigationLink(destination: GestureStartView(), label: {
                    ButtonView(buttonText: "Next")
                })
            }
            .padding()
        }
    }
}

#Preview {
    OnboardDeviceView3()
}

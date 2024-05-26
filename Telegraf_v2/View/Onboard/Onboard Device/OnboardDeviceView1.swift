//
//  OnboardDeviceView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 25/05/24.
//

import SwiftUI

struct OnboardDeviceView1: View {
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
                    Image("platform").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    // combine 2 text in one
                    HStack {
                        Text("Works on ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream"))
                        +
                        Text("iPhone, iPad, and Mac.")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Red"))
                    }
                    .frame(maxWidth: 450)
                    .multilineTextAlignment(.center)
                }
                
                
                NavigationLink(destination: OnboardDeviceView2(), label: {
                    ButtonView(buttonText: "Next")
                })
            }
            .padding()
        }
    }
}

#Preview {
    OnboardDeviceView1()
}

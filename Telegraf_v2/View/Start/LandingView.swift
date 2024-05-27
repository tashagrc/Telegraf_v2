//
//  ContentView.swift
//  Telegraf
//
//  Created by Natasha Radika on 19/05/24.
//

/*

 
 
 */

import SwiftUI

struct LandingView: View {
    @StateObject private var speech = SpeechViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Black")
                    .ignoresSafeArea()
                
                VStack(spacing: 200) {
                    VStack(spacing: 14) {
                        Text("Telegraf")
                            .font(.custom(FontName.italic_bold.rawValue, size: FontSize.size_logo.rawValue))
                            .foregroundColor(Color("Red"))
                        
                        Text("Chat Like It's the 1800s!")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_regtext.rawValue))
                            .foregroundColor(Color("Cream"))
                    }
                    Image("telegraf_landing").resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400)
                    VStack(spacing: 28) {
                        NavigationLink(destination: OnboardDeviceView1()) {
                            ButtonView(buttonText: "Onboard")
                        }
                        
                        NavigationLink(destination: StartView()) {
                            LinkView(linkText: "Go to playground", colorText: "Cream")
                        }
                    }
                }
                .padding()
            }
        }.accentColor(.white)
            .onAppear {
                let textToSpeak = "Welcome to Telegraf. Chat like it's the 1800s."
                speech.speak(textToSpeak)
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}


#Preview {
    LandingView()
}

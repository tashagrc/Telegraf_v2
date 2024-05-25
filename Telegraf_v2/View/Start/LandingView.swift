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
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Black")
                    .ignoresSafeArea()
                
                VStack(spacing: 120) {
                    HeaderView()
                    Image("telegraf_landing")
                    NavigationButtons()
                }
                .padding()
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 14) {
            Text("Telegraf")
                .font(.custom(FontName.italic_bold.rawValue, size: 56))
                .foregroundColor(Color("Red"))
            
            Text("Chat Like It's the 1800s!")
                .font(.custom(FontName.regular_light.rawValue, size: 16))
                .foregroundColor(Color("Cream"))
        }
    }
}

struct NavigationButtons: View {
    var body: some View {
        VStack(spacing: 28) {
            NavigationLink(destination: PlaygroundView()) {
                Text("Onboard")
                    .font(.custom(FontName.regular_light.rawValue, size: 32))
                    .foregroundColor(Color("Red"))
                    .padding(.horizontal, 80)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("Red"), lineWidth: 2)
                    )
            }
            
            NavigationLink(destination: StartView()) {
                Text("Go to playground")
                    .font(.custom(FontName.regular_light.rawValue, size: 16))
                    .foregroundColor(Color("Cream"))
                    .underline()
            }
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

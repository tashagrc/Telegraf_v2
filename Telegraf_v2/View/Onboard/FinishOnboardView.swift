//
//  FinishOnboardView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 25/05/24.
//

import SwiftUI

struct FinishOnboardView: View {
    var body: some View {
        ZStack {
            Color("Black")
                .ignoresSafeArea()
            
            VStack(spacing: 500) {
                
                    
                // combine 2 text in one
                HStack {
                    Text("Shaw, pshaw!\n\n")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Yellow")) +
                    Text("Remember, you can swipe ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream")) +
                    Text("up ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Red")) +
                    Text("to send your message to other device.\n\nThere are still more gestures to explore. You can learn them in the ")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Cream")) +
                    Text("Gestures Recap.")
                            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                            .foregroundColor(Color("Red"))
                    }
                    .frame(maxWidth: 450)
                
                
                NavigationLink(destination: GestureTrainingView1(), label: {
                    ButtonView(buttonText: "Done")
                })
            }
            .padding()
        }
    }
}

#Preview {
    FinishOnboardView()
}

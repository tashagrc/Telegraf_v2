//
//  MorseOnboardView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 27/05/24.
//

import SwiftUI

struct MorseOnboardView: View {
    var body: some View {
        VStack {
            MorseGuideView()
            ButtonView(buttonText: "Next").padding(.top, 10)
        }
    }
}

#Preview {
    MorseOnboardView()
}

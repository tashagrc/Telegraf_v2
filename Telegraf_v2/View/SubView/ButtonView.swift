//
//  Button.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 26/05/24.
//

import SwiftUI

struct ButtonView: View {
    let buttonText: String
    var body: some View {
        Text(buttonText)
            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
            .foregroundColor(Color("Red"))
            .padding(.horizontal, 80)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Red"), lineWidth: 2)
            )
    }
}

#Preview {
    ButtonView(buttonText: "Onboard")
}

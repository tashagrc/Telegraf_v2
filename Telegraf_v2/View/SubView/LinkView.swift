//
//  LinkView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 26/05/24.
//

import SwiftUI

struct LinkView: View {
    let linkText: String
    let colorText: String
    var body: some View {
        Text(linkText)
            .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_regtext.rawValue))
            .foregroundColor(Color(colorText))
            .underline()
    }
}

#Preview {
    LinkView(linkText: "Go to playground", colorText: "Cream")
}

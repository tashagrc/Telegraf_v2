//
//  CustomTabButton.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 23/05/24.
//

import SwiftUI

struct CustomTabButton: View {
    let text: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Text(text)
            .onTapGesture(perform: action)
            .foregroundColor(isSelected ? .black : Color("Cream")) // Change text color based on selection
            .padding(.horizontal, 30)
            .padding(.vertical, 10)
            .background(isSelected ? Color("Cream") : Color.clear) // Change background color based on selection
            .cornerRadius(20) // Add rounded corners
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("Cream"), lineWidth: isSelected ? 0 : 1) // Add border based on selection
            )
    }
}


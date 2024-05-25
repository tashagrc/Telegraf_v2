//
//  StartView.swift
//  RPS
//
//  Created by Joe Diragi on 7/28/22.
//

import SwiftUI

struct StartView: View {
    @State private var rpsSession: TelegrafMultipeerSession?
    @State private var username = ""
    @State private var isSessionStarted = false

    var body: some View {
        Group {
            if isSessionStarted, let rpsSession = rpsSession {
                PairView().environmentObject(rpsSession)
            } else {
                startViewBody
            }
        }
    }

    var startViewBody: some View {
        VStack {
            Spacer()
            Text("Enter name")
                .fontWeight(.heavy)
                .font(.largeTitle)
            Text("What's your name?")
                .font(.caption2)
                .fontWeight(.semibold)
                .padding(.horizontal, 40)
                .multilineTextAlignment(.center)
            TextField("Nickname", text: $username)
                .padding([.horizontal], 75.0)
                .padding(.bottom, 24)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Continue →") {
                rpsSession = TelegrafMultipeerSession(username: username)
                isSessionStarted = true
            }
            .buttonStyle(BorderlessButtonStyle())
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
            .foregroundColor(.white)
            .background(Color.accentColor)
            .cornerRadius(12)
            .disabled(username.isEmpty)
            Spacer()
        }
    }
}

#Preview {
    StartView()
}

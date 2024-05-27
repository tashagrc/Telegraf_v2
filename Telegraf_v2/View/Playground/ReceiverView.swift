//
//  ReceiverView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 23/05/24.
//

import SwiftUI

struct ReceiverView : View {
    @EnvironmentObject var rpsSession: TelegrafMultipeerSession
    @State var receiveMessage: String = ""
    @State var messageList: [String] = []
    
    let soundPlayer = SoundPlayer()
    
    var body: some View {
        VStack {
            Text("Receiver")
                    .font(.largeTitle)
                    .padding()

            List(messageList, id: \.self) { message in
                Text(message).onTapGesture {
                    soundPlayer.playMorseCode(message)
                }
            }

            Spacer()


            Button("Add Message") {
                messageList.append(rpsSession.receivedMessage)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}


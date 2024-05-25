//
//  PlaygroundView.swift
//  Telegraf
//
//  Created by Natasha Radika on 19/05/24.
//

import SwiftUI

struct PlaygroundView: View {
    // multipeer
    
    // tab
    @State var selectedTab = TabButton.TransmitterTab
    
    // morse code
    @State private var morseCode: String = ""
    @State private var morseLetter:String = ""
    
    // tentuin swipe downnya sekali atau 2 kali
    @State private var lastSwipeDownTime: Date? = nil
    @State private var swipeDownCount: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                // tab
                HStack() {
                    
                    CustomTabButton(text: "Transmitter", isSelected: selectedTab == .TransmitterTab) {
                        self.selectedTab = .TransmitterTab
                    }

                    CustomTabButton(text: "Receiver", isSelected: selectedTab == .ReceiverTab) {
                        self.selectedTab = .ReceiverTab
                    }
                    
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                
                if selectedTab == .TransmitterTab {
                    TransmitterView(morseCode: $morseCode, morseLetter: $morseLetter, lastSwipeDownTime: $lastSwipeDownTime, swipeDownCount: $swipeDownCount)
                } else if selectedTab == .ReceiverTab {
                    ReceiverView()
                }
                Spacer()
                 
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background {
                Color("Black").ignoresSafeArea()
            }
            .toolbar {
                // menu
                ToolbarItem(placement: .topBarLeading) {
                        VStack {
                            Text("Playground")
                                .font(.custom(FontName.regular_light.rawValue, size: 36))
                                .foregroundColor(Color("Cream"))
                        }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button {
                            
                        } label: {
                            Label("Gestures Recap", systemImage: "hand.tap")
                        }
                        
                        Button {
                            
                        } label: {
                            Label("Morse Guide", systemImage: "book")
                        }
                        
                        Button {
                            
                        } label: {
                            Label("Repeat Onboarding", systemImage: "restart.circle")
                        }
                        
                        Button {
                            
                        } label: {
                            Label("Disconnect Session", systemImage: "rectangle.portrait.and.arrow.forward")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(Color("Cream"))
                            .font(.system(size: 22))
                    }
                }
                
            }
         }.navigationBarBackButtonHidden(true)
        
        
        
    }
    
}





//
//  PlaygroundView.swift
//  Telegraf
//
//  Created by Natasha Radika on 19/05/24.
//

import SwiftUI

enum Tabs {
    case FirstTab
    case SecondTab
    case ThirdTab
}

struct PlaygroundView: View {
    @State var selectedTab = Tabs.FirstTab
    
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
                    
                    CustomTabButton(text: "Transmitter", isSelected: selectedTab == .FirstTab) {
                        self.selectedTab = .FirstTab
                    }

                    CustomTabButton(text: "Receiver", isSelected: selectedTab == .SecondTab) {
                        self.selectedTab = .SecondTab
                    }
                    
                }
                .padding(.top, 20)
                .padding(.bottom, 10)
                
                if selectedTab == .FirstTab {
                    TransmitterView(morseCode: $morseCode, morseLetter: $morseLetter, lastSwipeDownTime: $lastSwipeDownTime, swipeDownCount: $swipeDownCount)
                } else if selectedTab == .SecondTab {
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
                                .font(.custom(Constant.regular_light.rawValue, size: 36))
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

struct TransmitterView : View {
    @Binding var morseCode: String
    @Binding var morseLetter: String
    @Binding var lastSwipeDownTime: Date?
    @Binding var swipeDownCount: Int
    var body: some View {
        VStack {
            
            ZStack {
                Rectangle()
                    .frame(width: 350, height: 610)
                    .foregroundColor(Color("Gray"))
                    .cornerRadius(20)
                    .gesture(
                        TapGesture().onEnded {
                            morseLetter.append(".")
                        }
                    )
                    .gesture(
                        DragGesture(minimumDistance: 50)
                            .onEnded { value in
                                let horizontalAmount = value.translation.width
                                let verticalAmount = value.translation.height
                                
                                // tentuin dia swipe vertical atau horizontal
                                if abs(horizontalAmount) > abs(verticalAmount) {
                                    if horizontalAmount > 0 {
                                        // swipe right
                                        morseLetter.append("-")
                                    } else {
                                        // swipe left delete 1 karakter di morse letter
                                        if !morseLetter.isEmpty {
                                            morseLetter.removeLast()
                                            print("char remove " + morseLetter)
                                        } else if !morseCode.isEmpty {
                                            
                                            // kalo ga lagi nulis karakter, langsung delete 1 huruf
                                            morseCode = removeLastMorseLetter(morseCode: morseCode)
                                            print("letter remove " + morseCode)
                                        }
                                    }
                                } else { // swipe vertical
                                    if verticalAmount > 0 {
                                        handleSwipeDown()
                                    }
                                    else {
                                        // send to watch
                                        
                                    
                                        // reset screen
                                        morseLetter = ""
                                        morseCode = ""
                                        print("message sended")
                                    }
                                }
                                
                            }
                    )
                
                
                VStack(alignment: .leading) {
                    Text(morseCode)
                        .font(.custom(Constant.regular_light.rawValue, size: 36))
                        .foregroundStyle(Color("Cream"))
                        .padding(10)
                        .frame(maxWidth: 340, alignment: .leading)
                }
                .frame(width: 350, height: 610, alignment: .topLeading)
                .padding(.top, 10)
            }
            
            
            Button {
                
            } label: {
                Text("Write something for me")
                    .font(.custom(Constant.regular_light.rawValue, size: 16))
                    .foregroundStyle(Color("Cream"))
                    .underline()
            }
        }
    }
    
    
    func removeLastMorseLetter(morseCode: String) -> String {
        if let lastSpaceIndex = morseCode.dropLast().lastIndex(of: " ") {
            // substring sebelum space, ga termasuk space
            let substring = morseCode[..<lastSpaceIndex]
            // tambahin space agar langsung bisa mulai huruf berikutnya
            return String(substring) + " "
        }
        else { // kalo cuma ada 1 huruf
            return ""
        }
    }
    
    func handleSwipeDown() {
        let now = Date()
        
        // kalo swipe 2 kali
        if let lastTime = lastSwipeDownTime, now.timeIntervalSince(lastTime) < 0.8 {
            swipeDownCount += 1
        } else { // kalo swipe 1 kali
            swipeDownCount = 1
        }
        
        lastSwipeDownTime = now
        
        // kalo swipe 2 kali
        if swipeDownCount == 2 {
            if !morseCode.isEmpty {
                morseCode += "/"
            }
            
            swipeDownCount = 0
            print("swipe 2 kali")
        } else { // kalo swipe 1 kali
            morseCode += morseLetter + " "
            morseLetter = ""
        }
    }
    
}

struct ReceiverView : View {
    var body: some View {
        VStack {
            Text("receiver")
        }
    }
}


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


#Preview {
    PlaygroundView()
}



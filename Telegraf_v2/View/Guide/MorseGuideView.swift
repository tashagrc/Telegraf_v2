//
//  MorseGuideView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 25/05/24.
//

import SwiftUI

struct MorseGuideView: View {
    
    @StateObject private var morseCodeModel = Morse()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170, maximum: 170))
    ]
    
    
    var body: some View {
        
        ZStack {
            Color("Black")
                .ignoresSafeArea()
            ScrollView {
                HStack {
                            Text("Morse Guide")
                        .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                                .foregroundColor(Color("Red"))
                            Spacer()
                        }
                .padding(.leading, 70)
                
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(morseCodeModel.morseCodeDict.sorted(by: <), id: \.key) { letter, code in
                        ZStack {
                            Rectangle().frame(width: 170, height: 170).foregroundColor(Color("Gray")).cornerRadius(20)
                            
                            VStack {
                                Text(letter).font(.custom(FontName.regular_bold.rawValue, size: FontSize.size_letter.rawValue))
                                    .foregroundColor(Color("Cream"))
                                
                                Spacer()
                                Text(code).font(.custom(FontName.regular_bold.rawValue, size: FontSize.size_morse.rawValue))
                                    .foregroundColor(Color("Red"))
                            }
                            .padding(10)
                        }
                        
                    }
                }
            }
        }.accentColor(.white)
    }
}

#Preview {
    MorseGuideView()
}

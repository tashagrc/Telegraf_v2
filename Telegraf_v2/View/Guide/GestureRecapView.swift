//
//  GestureRecapView.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 25/05/24.
//

import SwiftUI

struct GestureRecapView: View {
    
    let gestureSections: [GestureTitle] = [
        GestureTitle(title: "Write a letter", items: [
            Gestures(name: "Tap to write a dot"),
            Gestures(name: "Swipe right to write a line")
        ]),
        GestureTitle(title: "Write and send your message", items: [
            Gestures(name: "Swipe down to confirm a letter"),
            Gestures(name: "Swipe down twice to write space between words"),
            Gestures(name: "Swipe up to send message to paired device")
        ]),
        GestureTitle(title: "Delete your message", items: [
            Gestures(name: "Swipe left to delete a character")
        ]),
    ]
    
    var body: some View {
        ZStack {
            Color("Black")
                .ignoresSafeArea()
            ScrollView() {
                VStack(alignment: .leading) {
                    Text("Gestures Recap")
                        .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_bigtext.rawValue))
                        .foregroundColor(Color("Red")).padding(.bottom, 10)
                    // list
                
                    ForEach(gestureSections) { section in
                        
                        VStack(alignment: .leading) {
                            Text(section.title)
                                .font(.custom(FontName.regular_bold.rawValue, size: FontSize.size_regtext.rawValue))
                                .foregroundColor(Color("Cream"))
                            
                            
                            ForEach(section.items) {
                                items in

                                Text(items.name)
                                    .font(.custom(FontName.regular_light.rawValue, size: FontSize.size_regtext.rawValue))
                                    .frame(width: 700, height: 60)
                                    .foregroundColor(Color("Cream")).background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(Color("Gray")) //
                                        )
                                
                                
                            }
                        }.padding(10)
                        
                    }
                }
               
                
                
                
                
                
            }
        }.accentColor(.white)
    }
}

#Preview {
    GestureRecapView()
}

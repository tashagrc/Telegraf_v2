//
//  Gesture.swift
//  Telegraf_v2
//
//  Created by Natasha Radika on 26/05/24.
//

import Foundation

struct Gestures: Identifiable {
    let id = UUID()
    let name: String
}

struct GestureTitle: Identifiable {
    let id = UUID()
    let title: String
    let items: [Gestures]
}

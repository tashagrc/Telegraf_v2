//
//  Constant.swift
//  Telegraf
//
//  Created by Natasha Radika on 19/05/24.
//

import Foundation

//-- Lora-Regular
//-- Lora-Italic
//-- Lora-Regular_Medium
//-- Lora-Italic_Medium-Italic
//-- Lora-Regular_SemiBold
//-- Lora-Italic_SemiBold-Italic
//-- Lora-Regular_Bold
//-- Lora-Italic_Bold-Italic

enum FontName : String {
    case regular_light = "Lora-Regular"
    case italic_light = "Lora-Italic"
    
    case regular_medium = "Lora-Regular_Medium"
    case italic_medium = "Lora-Italic_Medium-Italic"
    
    case regular_semibold = "Lora-Regular_SemiBold"
    case italic_semibold = "Lora-Italic_SemiBold-Italic"
    
    case regular_bold = "Lora-Regular_Bold"
    case italic_bold = "Lora-Italic_Bold-Italic"
}

//
//  ColorUtility.swift
//  EmojiFinder
//
//  Created by Aditya Himawan on 26/01/24.
//

import SwiftUI

struct ColorUtility {
    static func randomColor() -> Color {
        let randomColorUtility = Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
        return randomColorUtility
    }
}

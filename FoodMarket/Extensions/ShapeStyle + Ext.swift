//
//  ShapeStyle + Ext.swift
//  FoodMarketApp
//
//  Created by Alex on 19.03.2024.
//

import SwiftUI


public extension ShapeStyle where Self == Color {
    static var debug: Color {
    #if DEBUG
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    #else
        return Color(.clear)
    #endif
    }
}

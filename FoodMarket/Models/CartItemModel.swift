//
//  CartItemModel.swift
//  FoodMarket
//
//  Created by Alex on 22.01.2024.
//

import Foundation

struct CartItemModel: Identifiable {
    let id = UUID()
    let name: String
    let quantity: Int
    let price: Float
}

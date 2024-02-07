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
    
    var formattedPrice: String {
        return currencyFormatter.string(from: price as NSNumber)!
    }
    
    private let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_US")
        return currencyFormatter
    }()
    
}

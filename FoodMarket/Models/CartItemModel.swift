//
//  CartItemModel.swift
//  FoodMarket
//
//  Created by Alex on 22.01.2024.
//

import SwiftUI

class CartItemModel: Identifiable, ObservableObject {
    @Published var quantity: Int
    @Published var price: Float
    
    let id = UUID()
    let name: String
    
    init(name: String, quantity: Int, price: Float) {
        self.name = name
        self.quantity = quantity
        self.price = price
    }
    
    var formattedPrice: String {
        return currencyFormatter.string(from: (price * Float(quantity)) as NSNumber)!
    }
    
    private let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_US")
        return currencyFormatter
    }()
    
}

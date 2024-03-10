//
//  ProductModel.swift
//  FoodMarketApp
//
//  Created by Alex on 19.02.2024.
//

import Foundation

class ProductModel: Identifiable, ObservableObject {
    let id: Int
    let name: String
    let imageURL: URL?
    let description: String?
    let category: String
    let price: Float
    @Published var quantity: Int
    
    init(id: Int, name: String, imageURL: URL?, description: String?, category: String, price: Float, quantity: Int) {
        self.id = id
        self.name = name
        self.imageURL = imageURL
        self.description = description
        self.category = category
        self.price = price
        self.quantity = quantity
    }
    
    var formattedPrice: String {
        return currencyFormatter.string(from: price as NSNumber)!
    }
    
    var calculatedFormattedPrice: String {
        return currencyFormatter.string(from: (price * Float(quantity)) as NSNumber)!
    }
    
    private let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en_US")
        return currencyFormatter
    }()
}

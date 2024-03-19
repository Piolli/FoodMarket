//
//  Action.swift
//  FoodMarketApp
//
//  Created by Alex on 10.03.2024.
//

import Foundation

protocol Action {
    
}

enum StoreAction: Action {
    case loadProducts(for: StoreModel)
    case filterProducts(by: String)
}

enum CartAction: Action {
    case increaseQuantity(product: ProductModel)
    case remove(product: ProductModel)
}

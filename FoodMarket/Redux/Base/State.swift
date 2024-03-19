//
//  State.swift
//  FoodMarketApp
//
//  Created by Alex on 10.03.2024.
//

import Foundation

struct AppState {
    var cartState: CartState
    var storeState: StoreState
    
    init(cartState: CartState, storeState: StoreState) {
        self.cartState = cartState
        self.storeState = storeState
    }
    
    init() {
        self.init(cartState: CartState(products: []), storeState: StoreState(products: [], initialProducts: []))
    }
    
}

struct CartState {
    var products: [ProductModel]
}

struct StoreState {
    var products: [ProductModel]
    var initialProducts: [ProductModel]
    var filterType: String?
}

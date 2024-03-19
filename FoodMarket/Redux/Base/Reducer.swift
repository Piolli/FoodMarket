//
//  Reducer.swift
//  FoodMarketApp
//
//  Created by Alex on 10.03.2024.
//

import Foundation

typealias Reducer<Action, State> = (Action, State) -> State

let cartReducer: Reducer<Action, AppState> = { action, state in
    guard let action = action as? CartAction else { return state }
    var state = state
    
    switch action {
    case .increaseQuantity(let product):
        if let existedProduct = state.cartState.products.first(where: { $0.id == product.id }) {
            existedProduct.quantity += 1
        } else {
            product.quantity = 1
            state.cartState.products.append(product)
        }
    case .remove(let product):
        if let existedProduct = state.cartState.products.first(where: { $0.id == product.id }) {
            if existedProduct.quantity >= 1 {
                existedProduct.quantity -= 1
            }
            if existedProduct.quantity == 0 {
                state.cartState.products.removeAll(where: {
                    $0.id == product.id
                })
            }
        }
    }
    
    return state
}

let storeReducer: Reducer<Action, AppState> = { action, state in
    guard let action = action as? StoreAction else { return state }
    var state = state
    
    switch action {
    case .loadProducts(let `for`):
        let newProducts: [ProductModel] = (0...10).map { ProductModel(id: $0,
                                                                      name:  "Product #\($0)",
                                                                      imageURL: URL(string: $0 % 2 == 0
                                                                                    ? "https://storage.needpix.com/rsynced_images/red-304674_1280.png"
                                                                                    : "https://i2.pickpik.com/photos/480/989/100/apple-fruit-nutrition-red-preview.jpg"),
                                                                      description: nil,
                                                                      category: "CATEGORY #\($0 % 3)",
                                                                      price: Float($0) * 10 + 1,
                                                                      quantity: 0) }
        
        /// sync with cartStore
        newProducts.forEach { item in
            let quantity = state.cartState.products.first(where: { item.id == $0.id })?.quantity
            item.quantity = quantity ?? 0
        }
        if let filterType = state.storeState.filterType {
            state.storeState.products = state.storeState.initialProducts.filter { $0.category == state.storeState.filterType }
        } else {
            state.storeState.products = state.storeState.initialProducts
        }
        state.storeState.products = newProducts
        state.storeState.initialProducts = newProducts
    case .filterProducts(let by):
        state.storeState.products = state.storeState.initialProducts.filter { $0.category == by }
    }
    
    return state
}

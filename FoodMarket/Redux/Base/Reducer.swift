//
//  Reducer.swift
//  FoodMarketApp
//
//  Created by Alex on 10.03.2024.
//

import Foundation

typealias Reducer<Action, State> = (Action, State) -> State

let cardReducer: Reducer<CartAction, CartState> = { action, state in
    var state = state
    
    switch action {
    case .add(let product):
        if let existedProduct = state.products.first(where: { $0.id == product.id }) {
            existedProduct.quantity += 1
        } else {
            product.quantity = 1
            state.products.append(product)
        }
    case .remove(let product):
        if let existedProduct = state.products.first(where: { $0.id == product.id }) {
            if existedProduct.quantity >= 1 {
                existedProduct.quantity -= 1
            }
            if existedProduct.quantity == 0 {
                state.products.removeAll(where: {
                    $0.id == product.id
                })
            }
        }
    }
    
    return state
}

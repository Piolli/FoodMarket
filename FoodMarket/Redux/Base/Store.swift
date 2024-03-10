//
//  Store.swift
//  FoodMarketApp
//
//  Created by Alex on 10.03.2024.
//

import Foundation

typealias CartStore = Store<CartAction, CartState>

class Store<Action, State>: ObservableObject {
    
    @Published private(set) var state: State
    private let reducer: Reducer<Action, State>
    
    init(state: State, reducer: @escaping Reducer<Action, State>) {
        self.state = state
        self.reducer = reducer
    }
    
    func dispatch(action: Action) {
        self.state = reducer(action, state)
        
        /// TODO: add middleware logic
    }
    
}

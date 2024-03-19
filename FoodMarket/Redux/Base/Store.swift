//
//  Store.swift
//  FoodMarketApp
//
//  Created by Alex on 10.03.2024.
//

import Foundation

//typealias CartStore = Store<CartAction, CartState>
typealias AppStore = Store<AppState>

class Store<State>: ObservableObject {
    
    @Published private(set) var state: State
    private let reducers: [Reducer<Action, State>]
    
    init(state: State, reducers: [Reducer<Action, State>]) {
        self.state = state
        self.reducers = reducers
    }
    
    func dispatch(action: Action) {
        for reducer in reducers {
            self.state = reducer(action, state)
        }
        /// TODO: add middleware logic
    }
    
}

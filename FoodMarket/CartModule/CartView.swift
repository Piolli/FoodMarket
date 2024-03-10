//
//  CartView.swift
//  FoodMarket
//
//  Created by Alex on 22.01.2024.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject private var cartStore: CartStore
    
    var body: some View {
        List(cartStore.state.products) {
            CartItemView(productModel: $0)
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 8, leading: 12, bottom: 0, trailing: 12))
        }
        .listStyle(.plain)
    }
}

#Preview {
    CartView()
}

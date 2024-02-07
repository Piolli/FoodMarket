//
//  CartView.swift
//  FoodMarket
//
//  Created by Alex on 22.01.2024.
//

import SwiftUI

struct CartView: View {
    
    let products = (0...10).map { CartItemModel(name: "Product #\($0)", quantity: $0, price: Float($0) * 100) }
    
    var body: some View {
        List(products) {
            CartItemView(cartItem: $0)
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 8, leading: 12, bottom: 0, trailing: 12))
        }
        .listStyle(.plain)
    }
}

#Preview {
    CartView()
}

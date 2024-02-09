//
//  CartItemView.swift
//  FoodMarketApp
//
//  Created by Alex on 07.02.2024.
//

import SwiftUI
import Kingfisher

struct CartItemView: View {
    let cartItem: CartItemModel
    @State var quantity = 1
    
//    let mockImagePath = "https://plus.unspvlash.com/premium_photo-1661603980318-f3cf182b2ec8?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    let mockImagePath = "https://images.unsplash.com/photo-1563636619-e9143da7973b?q=80&w=3072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .center, spacing: 12) {
                KFImage.url(URL(string: mockImagePath))
                    .setCommonParams(imageSize: .init(width: 96, height: 96), cornerRadius: 4)
                    .frame(width: 96, height: 96)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(cartItem.name).font(.headline)
                    Text("\(cartItem.formattedPrice)").font(.subheadline)
                }.padding([.top, .bottom], 8)
            }
            
            Spacer()
            
            HStack {
                VStack(alignment: .center) {
                    Stepper(value: $quantity, in: 1...99, label: { }).labelsHidden()
                    Text("Quantity \(quantity)").font(.footnote)
                }
                Spacer().frame(width: 12)
            }
            
        }
        .frame(height: 96)
        .background(Color.black.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    CartItemView(cartItem: CartItemModel(name: "Some food food food\nfood food ffood food food food food food food food food", quantity: 25, price: 12.4))
}

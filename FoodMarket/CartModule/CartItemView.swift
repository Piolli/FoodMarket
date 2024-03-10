//
//  CartItemView.swift
//  FoodMarketApp
//
//  Created by Alex on 07.02.2024.
//

import SwiftUI
import Kingfisher

struct CartItemView: View {
    @EnvironmentObject var cartStore: CartStore
    @ObservedObject var productModel: ProductModel
    @State var loadingImage = true
    
    var body: some View {
        HStack(spacing: 0) {
            HStack(alignment: .center, spacing: 12) {
                KFImage.url(productModel.imageURL)
                    .setCommonParams(imageSize: .init(width: 96, height: 96),
                                     cornerRadius: 4,
                                     usePlaceHolder: false)
                    .onSuccess { _ in
                        loadingImage = false
                    }
                    .frame(width: 96, height: 96)
                    .skeleton { loadingImage }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(productModel.name).font(.headline)
                    Text("\(productModel.calculatedFormattedPrice)").font(.subheadline)
                }.padding([.top, .bottom], 8)
            }
            
            Spacer()
            
            HStack {
                VStack(alignment: .center) {
                    Stepper(
                        onIncrement: {
                            cartStore.dispatch(action: .add(product: productModel))
                        },
                        onDecrement: {
                            cartStore.dispatch(action: .remove(product: productModel))
                        },
                        label: { }
                    ).labelsHidden()
                    Text("\(productModel.quantity)").font(.subheadline)
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
    CartItemView(productModel: .init(id: 0, name: "Name", imageURL: nil, description: nil, category: "qwe", price: 12, quantity: 1))
        .environmentObject(CartStore(state: CartState(products: []), reducer: cardReducer))
}

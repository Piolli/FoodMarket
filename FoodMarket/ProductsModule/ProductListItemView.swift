//
//  ProductListItemView.swift
//  FoodMarketApp
//
//  Created by Alex on 19.02.2024.
//

import SwiftUI
import Kingfisher

struct ProductListItemView: View {
    
    @EnvironmentObject var cartStore: CartStore
    let productModel: ProductModel
    
    var body: some View {
        VStack {
            KFImage(productModel.imageURL)
                .setCommonParams(imageSize: .init(width: 100, height: 100), usePlaceHolder: true)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .clipped()
                .padding([.top, .leading, .trailing], 12)
            HStack {
                VStack(alignment: .center) {
                    Text(productModel.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(productModel.formattedPrice)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }.padding([.leading, .trailing, .bottom], 12)
            
            HStack {
                if productModel.quantity > 0 {
                    Button("-") {
                        cartStore.dispatch(action: .remove(product: productModel))
                    }
                    .frame(width: 64, height: 64)
                    .buttonStyle(.borderedProminent)
                    
                    Text("\(productModel.quantity)").overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                    
                    Button("+") {
                        cartStore.dispatch(action: .add(product: productModel))
                    }
                    .frame(width: 64, height: 64)
                    .buttonStyle(.borderedProminent)
                } else {
                    Button("Add product") {
                        cartStore.dispatch(action: .add(product: productModel))
                    }
                    .padding()
                    .frame(height: 64)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
    }
}

#Preview {
    ProductListItemView(productModel: .init(id: 0,
                                            name: "Name",
                                            imageURL: URL(string: "https://storage.needpix.com/rsynced_images/red-304674_1280.png"),
                                            description: "Desciprton",
                                            category: "",
                                            price: 12.10,
                                            quantity: 1))
    .environmentObject(CartStore(state: CartState(products: []), reducer: cardReducer))
    .frame(width: 300, height: 200)
}

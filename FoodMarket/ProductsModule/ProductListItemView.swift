//
//  ProductListItemView.swift
//  FoodMarketApp
//
//  Created by Alex on 19.02.2024.
//

import SwiftUI
import Kingfisher

struct ProductListItemView: View {
    
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
                Button("+") {
                    /// TODO: add product to cart
                }.buttonStyle(.borderedProminent)
            }.padding([.leading, .trailing, .bottom], 12)
        }
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.gray))
    }
}

#Preview {
    ProductListItemView(productModel: .init(name: "Name",
                                            imageURL: URL(string: "https://storage.needpix.com/rsynced_images/red-304674_1280.png"),
                                            description: "Desciprton",
                                            category: "",
                                            price: 12.10))
    .frame(width: 300, height: 200)
}

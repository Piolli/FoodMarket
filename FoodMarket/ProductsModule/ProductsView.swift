//
//  ProductsView.swift
//  FoodMarketApp
//
//  Created by Alex on 19.02.2024.
//

import SwiftUI

struct ProductsView: View {
    
    @Binding var navigationPath: NavigationPath

    @EnvironmentObject private var cartStore: CartStore
    @State private var products: [ProductModel] = []
    
    var body: some View {
        contentListView()
    }
    
    func contentListView() -> some View {
        let columns = [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ]

        return
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12, pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(products) { productItem in
                            ProductListItemView(productModel: productItem)
                        }
                    } header: {
                        HorizontalCapsulesView(viewModel: .init(items: products.map { .init(name: $0.name, isToggled: false) }))
                            .padding([.leading, .trailing], -16)
                    }
                }.padding([.leading, .trailing], 16)
            }
        .refreshable {
            await reload()
        }
        .onAppear {
            /// TODO: request new products
            /// store.dispatch(.fetchProducts(for: productStore))
            Task {
                await reload()
            }
        }
    }
    
    func reload() async {
        let newProducts: [ProductModel] = (0...10).map { ProductModel(id: $0,
                                                                      name:  "Product #\($0)",
                                                                      imageURL: URL(string: $0 % 2 == 0
                                                                                    ? "https://storage.needpix.com/rsynced_images/red-304674_1280.png"
                                                                                    : "https://i2.pickpik.com/photos/480/989/100/apple-fruit-nutrition-red-preview.jpg"),
                                                                      description: nil,
                                                                      category: "CATEGORY #\($0)",
                                                                      price: Float($0) * 10 + 1,
                                                                      quantity: 0) }
        
        newProducts.forEach { item in
            let quantity = cartStore.state.products.first(where: { item.id == $0.id })?.quantity
            item.quantity = quantity ?? 0
        }
        
        self.products = newProducts
    }
}

#Preview {
    NavigationStack {
        ProductsView(navigationPath: .constant(.init()))
    }
}

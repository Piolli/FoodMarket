//
//  ProductsView.swift
//  FoodMarketApp
//
//  Created by Alex on 19.02.2024.
//

import SwiftUI

struct ProductsView: View {
    
    @Binding var navigationPath: NavigationPath
    @EnvironmentObject private var appStore: AppStore
    @State private var productCategories: [HorizontalCapsuleItem] = []
    @State private var selectedItem: HorizontalCapsuleItem?
    
    let columns = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12, pinnedViews: [.sectionHeaders]) {
                Section {
                    ForEach(appStore.state.storeState.products) { productItem in
                        ProductListItemView(productModel: productItem)
                    }
                } header: {
                    HorizontalCapsulesView(selectedItem: $selectedItem,
                                           items: $productCategories)
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
            //  Task {
            //      await reload()
            //  }
            appStore.dispatch(action: StoreAction.loadProducts(for: .init(name: "Name", brandImageURL: nil)))
            
            productCategories = Array(Set(appStore.state.storeState.initialProducts.enumerated().map(\.element.category))).sorted().map { .init(name: $0,
                                                                                                                                                                     isToggled: true) }
            selectedItem = productCategories.first
            if let selectedItem {
                self.appStore.dispatch(action: StoreAction.filterProducts(by: selectedItem.name))
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
            let quantity = appStore.state.cartState.products.first(where: { item.id == $0.id })?.quantity
            item.quantity = quantity ?? 0
        }
    }
}

#Preview {
    NavigationStack {
        ProductsView(navigationPath: .constant(.init()))
    }
}

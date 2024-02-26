//
//  StoreProductCategoriesView.swift
//  FoodMarketApp
//
//  Created by Alex on 14.02.2024.
//

import SwiftUI

extension View {
    static var navigationID: String {
        return String(describing: Self.self)
    }
}

struct StoreProductCategoriesView: View {
    
    @Binding var navigationPath: NavigationPath
    
    var storeModel: StoreModel
    
    private let productTypes = [
        "Vegetables, fruits, nuts",
        "Fish, caviar",
        "Type, long, long, long, long, long, long, long, long, long, long",
        "Type, type, type, type 1",
        "Type, type, type, type 2",
        "Type, type, type, type 3",
        "Type, type, type, type 4 ",
        "Type, type, type, type 5"
    ]
    
    var body: some View {
        contentListView().navigationTitle(storeModel.name)
    }
    
    func contentListView() -> some View {
        let columns = [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ]
        
        return ScrollView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(productTypes, id: \.self) { category in
                        let url = URL(string: "https://images.unsplash.com/photo-1516885440144-05ba68c5b5ab?q=80&w=3077&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
                        StoreProductCategoryItemView(categoryName: category, backgroundImageURL: url, action: {
                            print("On select product category \(category)")
                            navigationPath.append(ProductsView.navigationID)
                        })
                    }
                    Spacer().frame(height: 4)
                }
            }
        }
        .refreshable {
            // TODO: viewModel.reload()
        }
        .padding()
    }
}

#Preview {
    StoreProductCategoriesView(navigationPath: .constant(.init()), storeModel: .init(name: "SomeModel", brandImageURL: nil))
}

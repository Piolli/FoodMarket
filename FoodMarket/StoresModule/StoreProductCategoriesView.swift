//
//  StoreProductCategoriesView.swift
//  FoodMarketApp
//
//  Created by Alex on 14.02.2024.
//

import SwiftUI

struct StoreProductCategoriesView: View {
    
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
                        StoreProductCategoryItemView(categoryName: category, action: {
                            print("On select product category \(category)")
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
    StoreProductCategoriesView(storeModel: .init(name: "SomeModel", brandImageURL: nil))
}

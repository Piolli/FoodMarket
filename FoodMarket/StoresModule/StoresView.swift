//
//  StoresView.swift
//  FoodMarket
//
//  Created by Alex on 22.01.2024.
//

import SwiftUI

struct StoresView: View {
    
    let stores = (0...10).map { StoreModel(name: "Store #\($0)", brandImageURL: nil) }
    
    var body: some View {
        List(stores) {
            Text("\($0.name) \($0.brandImageURL?.absoluteString ?? "")")
        }
    }
}

#Preview {
    StoresView()
}

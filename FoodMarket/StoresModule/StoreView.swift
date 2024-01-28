//
//  StoreView.swift
//  FoodMarketApp
//
//  Created by Alex on 25.01.2024.
//

import SwiftUI

struct StoreView: View {
    
    let name: String
    let action: (() -> Void)
    let backgroundImageURL: URL? = nil
    
    var body: some View {
        Button(action: action, label: {
            Text(name)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundStyle(Color.white)
                .background(Color.blue)
                .cornerRadius(8)
        })
    }
}

#Preview {
    StoreView(name: "Store", action: { })
        .frame(width: 200, height: 100, alignment: .center)
}

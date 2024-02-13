//
//  StoreProductCategoryItemView.swift
//  FoodMarketApp
//
//  Created by Alex on 14.02.2024.
//

import SwiftUI

/// TODO: refactor to Button with custom style?
struct StoreProductCategoryItemView: View {
    
    let categoryName: String
    let action: (() -> Void)
    
    @State var isPressed = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8).fill(isPressed ? Color.blue.opacity(0.65) : Color.blue)
            VStack {
                HStack {
                    Text(categoryName)
                    Spacer()
                }
                Spacer()
            }
            .padding([.leading, .trailing], 12)
            .padding([.top, .bottom], 16)
        }
        .onTapGesture {
            action()
        }
        .onLongPressGesture(perform: {
            print("onLongPressGesture")
            /// TODO: add to favourites?
            /// handle `3d` touch press to show menu with some options
        }, onPressingChanged: { isPressed in
            self.isPressed = isPressed
        })
        
        .frame(height: 120)
    }
}

#Preview {
    StoreProductCategoryItemView(categoryName: "Some category name", action: { })
}

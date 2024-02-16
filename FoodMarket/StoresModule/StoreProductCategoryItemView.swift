//
//  StoreProductCategoryItemView.swift
//  FoodMarketApp
//
//  Created by Alex on 14.02.2024.
//

import SwiftUI
import Kingfisher

/// TODO: refactor to Button with custom style?
struct StoreProductCategoryItemView: View {
    
    let categoryName: String
    let backgroundImageURL: URL?
    let action: (() -> Void)
    
    @State var isPressed = false
    
    var body: some View {
        ZStack {
                GeometryReader { proxy in
                    KFImage(backgroundImageURL)
                        .setCommonParams(imageSize: .init(width: 100, height: 100),
                                         cornerRadius: 0,
                                         /// move mock-image slighly right (design images must be bottom-right alignment)
                                         additionalProcessor: CroppingImageProcessor(size: .init(width: 70, height: 65), anchor: .init(x: 0, y: 0.5)))
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                        .clipped()
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .ignoresSafeArea()

            VStack {
                HStack {
                    Text(categoryName).foregroundStyle(Color.black).font(.callout).bold()
                    Spacer()
                }
                Spacer()
            }
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 8)
        }
        .frame(height: 120)
        .overlay(RoundedRectangle(cornerRadius: 8).fill(isPressed ? Color.gray.opacity(0.2) : Color.clear))
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
        .contentShape(Rectangle())
    }
}

#Preview {
    StoreProductCategoryItemView(categoryName: "Some category name",
                                 backgroundImageURL: URL(string: "https://images.unsplash.com/photo-1516885440144-05ba68c5b5ab?q=80&w=3077&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                 action: { })
    .frame(width: 130, height: 90, alignment: .center)
}

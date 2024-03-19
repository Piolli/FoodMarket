//
//  HorizontalCapsulesView.swift
//  FoodMarketApp
//
//  Created by Alex on 21.02.2024.
//

import SwiftUI

struct HorizontalCapsuleItem: Identifiable, Equatable {
    let id = UUID()
    var isToggled: Bool
    let name: String
    
    init(name: String, isToggled: Bool) {
        self.name = name
        self.isToggled = isToggled
    }
}

struct HorizontalCapsulesView: View {
    @EnvironmentObject var appStore: AppStore
    @Binding var selectedItem: HorizontalCapsuleItem?
    @Binding var items: [HorizontalCapsuleItem]
    
    init(selectedItem: Binding<HorizontalCapsuleItem?>, items: Binding<[HorizontalCapsuleItem]>) {
        self._selectedItem = selectedItem
        self._items = items
    }
    
    var body: some View {
        ScrollViewReader { scrollPosition in
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(items) { item in
                        Toggle(item.name, isOn: Binding<Bool>(get: {
                            self.selectedItem == item
                        },
                                                              set: { _ in
                            self.selectedItem = item
                            self.appStore.dispatch(action: StoreAction.filterProducts(by: item.name))
                            withAnimation {
                                scrollPosition.scrollTo(item.id, anchor: .center)
                            }
                        }))
                        .toggleStyle(ButtonableToggleStyle())
                        .id(item.id)
                    }
                }
                .padding([.leading, .trailing], 8)
                .padding([.top, .bottom], 12)
            }
            .background(Rectangle()
                /// TODO: add some color?
    //            .fill(Color.gray.opacity(0.2))
                .fill(Material.ultraThin)
                .clipShape(.rect(bottomLeadingRadius: 16, bottomTrailingRadius: 16))
            )
        .scrollIndicators(.never)
        }
    }
}

#Preview {
    VStack {
//        HorizontalCapsulesView(selectedItem: .constant(nil), items: .constant([]))
        HorizontalCapsulesView(selectedItem: .constant(.init(name: "Name", isToggled: false)), items: .constant([]))
//        HorizontalCapsulesView(items: [])
        Spacer()
    }
}

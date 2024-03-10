//
//  HorizontalCapsulesView.swift
//  FoodMarketApp
//
//  Created by Alex on 21.02.2024.
//

import SwiftUI

class HorizontalCapsuleViewModel: ObservableObject {
    @Published var selectedItem: HorizontalCapsuleItem?
    var items: [HorizontalCapsuleItem]
    
    init(items: [HorizontalCapsuleItem]) {
        selectedItem = items.first
        self.items = items
    }
    
    func getBindingIsOn(for item: HorizontalCapsuleItem, scrollViewProxy: ScrollViewProxy) -> Binding<Bool> {
        return Binding<Bool>(get: { self.selectedItem == item },
                             set: { _ in
            self.selectedItem = item
            withAnimation {
                scrollViewProxy.scrollTo(item.id, anchor: .center)
            }
        })
    }
    
    deinit {
        print("DEINIT_\(Self.self)")
    }
}

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
    @ObservedObject var viewModel: HorizontalCapsuleViewModel
    
    var body: some View {
        ScrollViewReader { scrollPosition in
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(viewModel.items) { item in
                        Toggle(item.name, isOn: viewModel.getBindingIsOn(for: item, scrollViewProxy: scrollPosition))
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
        HorizontalCapsulesView(viewModel: .init(items: (0...15).map { .init(name: "Item #\($0)", 
                                                                            isToggled: false) }))
        Spacer()
    }
}
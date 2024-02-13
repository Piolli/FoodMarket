//
//  StoresView.swift
//  FoodMarket
//
//  Created by Alex on 22.01.2024.
//

import SwiftUI

struct StoresView: View {
    
    let types = ["Supermarket", "Hypermarket", "PetStore"]
    let storeNames = ["FirstStore", "SecondStore", "Multiline Store With Long Name"]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            contentListView()
                .navigationDestination(for: String.self) { value in
                    StoreProductCategoriesView(storeModel: .init(name: value, brandImageURL: nil))
                }
        }
    }
    
    func contentListView() -> some View {
        let columns = [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ]

        
        return ScrollView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(types.indices, id: \.self) { oindex in
                        Section {
                            ForEach(0..<10) { index in
                                let storeName = storeNames[index % storeNames.count]
                                StoreView(name: storeName, action: {
                                    print("Selected store \(storeName)")
                                    path.append(storeName)
                                })
                            }
                        } header: {
                            HStack {
                                Text("\(types[oindex % types.count])").font(.title2).bold()
                                Spacer()
                            }
                        }
                        Spacer().frame(height: 4)
                    }
                }
            }
        }
        .refreshable {
            await reload()
        }
        .padding()
    }
    
    func reload() async {
        print("Stores list reloading")
    }
}

#Preview {
    StoresView()
}

//
//  FoodMarketApp.swift
//  FoodMarket
//
//  Created by Alex on 21.01.2024.
//

import SwiftUI

@main
struct FoodMarketApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(AppStore(state: AppState(), reducers: [cartReducer, storeReducer]))
        }
    }
}

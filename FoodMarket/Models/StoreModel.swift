//
//  StoreModel.swift
//  FoodMarket
//
//  Created by Alex on 22.01.2024.
//

import SwiftUI

struct StoreModel: Identifiable {
    let id = UUID()
    let name: String
    let brandImageURL: URL?
}

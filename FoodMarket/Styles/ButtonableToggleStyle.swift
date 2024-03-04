//
//  ButtonableToggleStyle.swift
//  FoodMarketApp
//
//  Created by Alex on 24.02.2024.
//

import SwiftUI

struct ButtonableToggleStyle: ToggleStyle {
    
    @Environment(\.colorScheme) var colorTheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(colorTheme == .dark ? Color.white : Color.black)
            .font(.system(size: 13))
            .padding([.leading, .trailing], 8)
            .padding([.top, .bottom], 10)
            .background {
                if configuration.isOn {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.5))
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                }
            }.onTapGesture {
                configuration.isOn.toggle()
            }
    }
}

//
//  Skeleton.swift
//  FoodMarketApp
//
//  Created by Alex on 16.02.2024.
//

import SwiftUI

struct SkeletonableView: ViewModifier {
    
    var isEmptyContent: (() -> Bool)
    @State private var isAnimating = false
    
    @State var gradient = [Color.gray, Color.white]
    @State var hueRotationValue = 0.0
    @State var saturationValue = 1.0
    
    @State var opacity = 1.0
    
    let startGradient = Gradient(colors: [])
    
    func body(content: Content) -> some View {
        guard isEmptyContent() else {
            return AnyView(content)
        }
        
        return AnyView(content.overlay(RoundedRectangle(cornerRadius: 8)
            .fill(LinearGradient(gradient: Gradient(colors: self.gradient), startPoint: .leading, endPoint: .trailing))
            .hueRotation(Angle(degrees: self.hueRotationValue))
            .saturation(self.saturationValue)
            .onAppear {
                withAnimation (.linear(duration: 1).repeatForever()) {
                    self.hueRotationValue = 120
                    self.saturationValue = 0.7
                    opacity = 0.5
                }
            }).opacity(opacity))
        
    }

}

extension View {
    func skeleton(isEmptyContent: @escaping (() -> Bool)) -> some View {
        modifier(SkeletonableView(isEmptyContent: isEmptyContent))
    }
}

private struct TestSkeletonView: View {
    @State var array: [Int] = []
    @State var textButton = ""

    var body: some View {
        VStack {
            Button(textButton) {
                self.array = []
                textButton = ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    self.array = [1, 2, 3]
                    textButton = "Hello world"
                }
            }.buttonStyle(.bordered)
        }
        .skeleton {
            array.isEmpty
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.array = [1, 2, 3]
                textButton = "Hello world"
            }
        })
    }
}

#Preview {
    TestSkeletonView()
}

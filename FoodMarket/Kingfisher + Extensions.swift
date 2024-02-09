//
//  Kingfisher + Extensions.swift
//  FoodMarketApp
//
//  Created by Alex on 10.02.2024.
//

import SwiftUI
import Kingfisher

extension KFImageProtocol {
    func setCommonParams(imageSize: CGSize, cornerRadius: CGFloat?) -> Self {
        var imageProcessor: ImageProcessor = DownsamplingImageProcessor(size: imageSize)
        if let cornerRadius {
            imageProcessor = imageProcessor |> RoundCornerImageProcessor(cornerRadius: 4)
        }
        
        return self
            .placeholder{
                ProgressView()
            }
            .scaleFactor(UIScreen.main.scale)
            .setProcessor(imageProcessor)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
    }
}


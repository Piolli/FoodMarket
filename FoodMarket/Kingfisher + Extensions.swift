//
//  Kingfisher + Extensions.swift
//  FoodMarketApp
//
//  Created by Alex on 10.02.2024.
//

import SwiftUI
import Kingfisher

extension KFImageProtocol {
    func setCommonParams(imageSize: CGSize, 
                         cornerRadius: CGFloat? = nil,
                         additionalProcessor: ImageProcessor? = nil,
                         usePlaceHolder: Bool = true) -> Self {
        var imageProcessor: ImageProcessor = DownsamplingImageProcessor(size: imageSize)
        
        if let cornerRadius {
            imageProcessor = imageProcessor |> RoundCornerImageProcessor(cornerRadius: cornerRadius)
        }
        
        if let additionalProcessor {
            imageProcessor = imageProcessor |> additionalProcessor
        }
        
        return self
            .placeholder {
                if usePlaceHolder {
                    ProgressView()
                }
            }
            .scaleFactor(UIScreen.main.scale)
            .setProcessor(imageProcessor)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
    }
}


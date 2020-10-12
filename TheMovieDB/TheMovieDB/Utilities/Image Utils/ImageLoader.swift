//
//  ImageLoader.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    func loadImage(fromURL urlString: String?) {
        guard let value = urlString, let url = URL(string: value) else {
            return
        }
        loadImage(from: url)
    }
    
    func loadImage(from url: URL) {
        Nuke.loadImage(with: url, into: self)
    }
    
    func loadImageWithPlaceholder(
        fromURL urlString: String?,
        placeholder: String? = "placeholder",
        cornerRadius: CGFloat = 0.0 // Send value greater than 0 to set
    ) {
        guard let value = urlString, let url = URL(string: value) else {
            return
        }
        
        var placeholderImage: UIImage?
        if let assetName = placeholder, !assetName.isEmpty, let value = UIImage(named: assetName) {
            placeholderImage = value
        }
        
        var imageRequest = ImageRequest(url: url)
        
        if cornerRadius > 0 {
            imageRequest.processors = [ImageProcessors.RoundedCorners(radius: cornerRadius)]
        }
        
        let imageLoadingOptions = ImageLoadingOptions(
            placeholder: placeholderImage,
            transition: .fadeIn(duration: 0.5),
            failureImage: placeholderImage
        )
        
        Nuke.loadImage(
            with: imageRequest,
            options: imageLoadingOptions,
            into: self,
            progress: nil,
            completion: nil
        )
    }
    
    func loadRoundedImage(
        fromURL urlString: String?,
        placeholder: String? = "placeholder"
    ) {
        guard let value = urlString, let url = URL(string: value) else {
            return
        }
        
        var placeholderImage: UIImage?
        if let assetName = placeholder, !assetName.isEmpty, let value = UIImage(named: assetName) {
            placeholderImage = value
        }
        
        var imageRequest = ImageRequest(url: url)
        
        imageRequest.processors = [
            ImageProcessors.Circle(
                border: ImageProcessingOptions.Border.init(
                    color: .white, width: 2
                )
            )
        ]
        
        let imageLoadingOptions = ImageLoadingOptions(
            placeholder: placeholderImage,
            transition: .fadeIn(duration: 0.5),
            failureImage: placeholderImage
        )
        
        Nuke.loadImage(
            with: imageRequest,
            options: imageLoadingOptions,
            into: self,
            progress: nil,
            completion: nil
        )
    }
}

//
//  ImageURLBuilder.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct ImageURLBuilder {
    private let imageBaseURL: String
    private let scale: ImageScale
    
    func getImageURL(imagePath: String?) -> String? {
        guard let imagePath = imagePath, !imagePath.isEmpty else {
            return nil
        }
        
        var imageURL = imageBaseURL
        
        if imageURL.hasSuffix("/") {
            imageURL = "\(imageURL)\(scale.size)"
        } else {
            imageURL = "\(imageURL)/\(scale.size)"
        }
        
        if imagePath.hasPrefix("/") {
            imageURL = "\(imageURL)\(imagePath)"
        } else {
            imageURL = "\(imageURL)/\(imagePath)"
        }
        
        return imageURL
    }
}

extension ImageURLBuilder {
    init(scale: ImageScale) {
        self.init(imageBaseURL: ImageURLBuilder.imageBaseURL, scale: scale)
    }
}

extension ImageURLBuilder {
    static var imageBaseURL: String {
        "https://image.tmdb.org/t/p"
    }
    
    static var smallScaled: ImageURLBuilder {
        ImageURLBuilder(
            imageBaseURL: imageBaseURL,
            scale: .small
        )
    }
    
    static var largeScaled: ImageURLBuilder {
        ImageURLBuilder(
            imageBaseURL: imageBaseURL,
            scale: .large
        )
    }
}

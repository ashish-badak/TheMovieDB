//
//  ImageURLBuilder.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct ImageURLBuilder {
    private let scale: ImageScale
    private let imageBaseURL: String
    
    init(imageBaseURL: String, scale: ImageScale) {
        self.imageBaseURL = imageBaseURL
        self.scale = scale
    }
    
    func getImageURL(imagePath: String) -> String {
        return [imageBaseURL, scale.size, imagePath].joined(separator: "/")
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

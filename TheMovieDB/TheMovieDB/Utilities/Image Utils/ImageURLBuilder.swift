//
//  ImageURLBuilder.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol ImageURLBuilder {
    var imageBaseURL: String { get }
    var scale: ImageScaler { get }
    func getImageURL(imagePath: String?) -> String?
}

extension ImageURLBuilder {
    var imageBaseURL: String { "https://image.tmdb.org/t/p" }

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

struct DefaultImageURLBuilder {
    private let scale: ImageScaler
}

struct ProfileImageURLBuilder: ImageURLBuilder {
    var scale: ImageScaler
    
    init(scale: ImageScale.Profile) {
        self.scale = scale
    }
}

struct PosterImageURLBuilder: ImageURLBuilder {
    var scale: ImageScaler
    
    init(scale: ImageScale.Poster) {
        self.scale = scale
    }
}

struct BannerImageURLBuilder: ImageURLBuilder {
    var scale: ImageScaler
    
    init(scale: ImageScale.Banner) {
        self.scale = scale
    }
}

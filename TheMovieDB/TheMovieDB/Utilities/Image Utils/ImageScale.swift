//
//  ImageScale.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

enum ImageScale {
    case large
    case small
    case custom(width: Float)
    
    var size: String {
        switch self {
        case .large: return "w500"
        case .small: return "w200"
        case .custom(let width):
            if width > 0 {
                return "w\(width)"
            } else {
                return ImageScale.large.size
            }
        }
    }
}

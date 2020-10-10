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
    
    var size: String {
        switch self {
        case .large: return "w500"
        case .small: return "w200"
        }
    }
}

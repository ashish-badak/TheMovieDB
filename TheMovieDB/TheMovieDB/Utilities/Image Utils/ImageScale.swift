//
//  ImageScale.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation
import UIKit

protocol ImageScaler {
    var size: String { get }
}

enum ImageScale {
    enum Poster: ImageScaler {
        case large
        case small
        
        var size: String {
            switch self {
            case .large: return "w500"
            case .small: return "w200"
            }
        }
    }
    
    enum Banner: ImageScaler {
        case deviceScaled
    
        var size: String {
            let widthInPixel = UIScreen.main.bounds.width.pointsToPixel()
            if widthInPixel > 800 {
                return "w1280"
            } else {
                return "w780"
            }
        }
    }
    
    enum Profile: ImageScaler {
        case common
        
        var size: String { return "w185" }
    }
}

extension CGFloat {
    func pointsToPixel() -> CGFloat {
        return self * UIScreen.main.scale
    }
}

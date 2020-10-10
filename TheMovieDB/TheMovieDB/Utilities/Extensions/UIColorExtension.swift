//
//  UIColorExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

extension UIColor {
    enum TMDB {
        static var primary: UIColor {
            .init(red: 12, green: 37, blue: 63, alpha: 1)
        }
        static var secondary: UIColor {
            .init(red: 1, green: 180, blue: 228, alpha: 1)
        }
        static var ternary: UIColor {
            .init(red: 144, green: 206, blue: 161, alpha: 1)
        }
        
    }
    
    enum Border {
        static var primary: UIColor { UIColor.TMDB.primary }
        static var secondary: UIColor {
            .init(red: 150, green: 150, blue: 150, alpha: 1)
        }
    }
    
    enum Background {
        static var button: UIColor { UIColor.TMDB.secondary }
    }
    
    enum Font {
        static var heading: UIColor { UIColor.TMDB.primary }
        
        static var title: UIColor { .black }
        
        static var subtitle: UIColor {
            .init(red: 215, green: 215, blue: 215, alpha: 1)
        }
        
        static var listing: UIColor {
            .init(red: 190, green: 190, blue: 190, alpha: 1)
        }
        
        static var buttonTitle: UIColor { .white }
    }
}

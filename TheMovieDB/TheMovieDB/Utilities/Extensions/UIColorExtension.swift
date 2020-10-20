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
            .init(red: 12/255, green: 37/255, blue: 63/255, alpha: 1)
        }
        static var secondary: UIColor {
            .init(red: 1/255, green: 180/255, blue: 228/255, alpha: 1)
        }
        static var ternary: UIColor {
            .init(red: 144/255, green: 206/255, blue: 161/255, alpha: 1)
        }
        
    }
    
    enum Border {
        static var primary: UIColor { UIColor.TMDB.primary }
        static var secondary: UIColor { UIColor.TMDB.secondary }
        static var image: UIColor { UIColor.black.withAlphaComponent(0.3) }
    }
    
    enum Background {
        static var button: UIColor { UIColor.TMDB.secondary }
        static var lists: UIColor { .white }
        static var cards: UIColor { UIColor.TMDB.primary.withAlphaComponent(0.3) }
    }
    
    enum Font {
        static var heading: UIColor { UIColor.TMDB.primary }
        
        static var title: UIColor { .black }
        
        static var subtitle: UIColor {
            .init(red: 60/255, green: 60/255, blue: 60/255, alpha: 1)
        }
        
        static var listing: UIColor {
            .init(red: 120/255, green: 120/255, blue: 120/255, alpha: 1)
        }
        
        static var buttonTitle: UIColor { .white }
    }
}

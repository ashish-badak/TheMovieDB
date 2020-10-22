//
//  TextStyler.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

struct TextStyle {
    let font: UIFont
    let color: UIColor
}

enum TextStyler {
    static var title: TextStyle {
        .init(font: .systemFont(ofSize: 16), color: UIColor.Font.title)
    }
    
    static var subtitle: TextStyle {
        .init(font: .systemFont(ofSize: 14), color: UIColor.Font.subtitle)
    }
    
    static var normal: TextStyle {
        .init(font: .systemFont(ofSize: 14), color: UIColor.Font.listing)
    }
    
    static var trival: TextStyle {
        .init(font: .systemFont(ofSize: 12), color: UIColor.Font.listing)
    }
    
    
    static var cardHeading: TextStyle {
        .init(font: .boldSystemFont(ofSize: 16), color: UIColor.TMDB.primary)
    }
    static var cardTitle: TextStyle {
        .init(font: .systemFont(ofSize: 14), color: .white)
    }
    static var cardSubtitle: TextStyle {
        .init(font: .systemFont(ofSize: 12), color: UIColor.Font.subtitle)
    }
    
    static var cardDescription: TextStyle {
        .init(font: .systemFont(ofSize: 14), color: UIColor.Font.subtitle)
    }
    
    static var reviewTitle: TextStyle {
        .init(font: .systemFont(ofSize: 12), color: UIColor.Font.title)
    }
    
    static var reviewDescription: TextStyle {
        .init(font: .systemFont(ofSize: 10), color: UIColor.Font.listing)
    }
    
    static var searchResult: TextStyle {
        .init(font: .systemFont(ofSize: 12), color: .black)
    }
}

extension UILabel {
    static func stylise(_ label: UILabel, textStyle: TextStyle) {
        label.font = textStyle.font
        label.textColor = textStyle.color
    }
}

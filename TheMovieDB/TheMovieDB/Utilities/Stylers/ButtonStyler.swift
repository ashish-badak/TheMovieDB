//
//  ButtonStyler.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

struct ButtonStyle {
    let font: UIFont
    let titleColor: UIColor
    let backgroundColor: UIColor?
    let cornerRadius: CGFloat?
    let borderStyle: BorderStyle?
    let tintColor: UIColor?
    let contentEdgeInsets: UIEdgeInsets?
}

enum ButtonStyler {
    static var `default`: ButtonStyle {
        .init(
            font: .systemFont(ofSize: 12),
            titleColor: UIColor.Font.buttonTitle,
            backgroundColor: UIColor.Background.button,
            cornerRadius: 4,
            borderStyle: BorderStyler.default,
            tintColor: nil,
            contentEdgeInsets: UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5)
        )
    }
}

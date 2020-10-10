//
//  UIButtonExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

extension UIButton {
    static func stylise(_ button: UIButton, style: ButtonStyle) {
        if let backgroundColor = style.backgroundColor {
            button.backgroundColor = backgroundColor
        }
        
        button.setTitleColor(style.titleColor, for: UIControl.State.normal)
        button.setTitleColor(style.titleColor, for: UIControl.State.selected)
        button.setTitleColor(style.titleColor, for: UIControl.State.highlighted)
         
        button.titleLabel?.font = style.font
        
        if let borderStyle = style.borderStyle {
            button.setBorder(
                color: borderStyle.color,
                size: borderStyle.thickness,
                cornerRadius: style.cornerRadius ?? 0
            )
        } else if let cornerRadius = style.cornerRadius {
            button.setAsRounded(cornerRadius: cornerRadius)
        }
        
        if let tintColor = style.tintColor {
            button.tintColor = tintColor
        }
         
        if let contentEdgeInsets = style.contentEdgeInsets {
            button.contentEdgeInsets = contentEdgeInsets
        }
    }
}

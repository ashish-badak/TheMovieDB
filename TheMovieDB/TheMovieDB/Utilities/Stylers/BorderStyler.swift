//
//  BorderStyler.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

struct BorderStyle {
    let color: UIColor
    let thickness: CGFloat
}

enum BorderStyler {
    static var `default`: BorderStyle {
        .init(color: .black, thickness: 1)
    }
}

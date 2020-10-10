//
//  BorderStyle.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

struct BorderStyle {
    let edges: UIRectEdge
    let color: UIColor
    let thickness: CGFloat
}

enum BorderStyler {
    static var `default`: BorderStyle {
        .init(edges: .all, color: .black, thickness: 1)
    }
}

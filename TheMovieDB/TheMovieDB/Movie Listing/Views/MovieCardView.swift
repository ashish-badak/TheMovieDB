//
//  MovieCardView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieCardView: UIView, NibFileOwnerLoadbleView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
}


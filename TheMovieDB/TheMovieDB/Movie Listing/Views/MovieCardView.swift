//
//  MovieCardView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieCardView: UIView, NibFileOwnerLoadbleView {
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    @IBOutlet weak var bookNowButton: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
}


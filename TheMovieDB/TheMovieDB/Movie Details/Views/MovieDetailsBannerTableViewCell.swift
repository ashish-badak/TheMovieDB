//
//  MovieDetailsBannerTableViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieDetailsBannerTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        selectionStyle = .none
    }
}

//
//  MovieDetailsBannerTableViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieDetailsBannerTableViewCell: UITableViewCell, NibLoadableView {
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        selectionStyle = .none
        UILabel.stylise(titleLabel, textStyle: TextStyler.title)
        UILabel.stylise(genreLabel, textStyle: TextStyler.trival)
        UILabel.stylise(releaseDateLabel, textStyle: TextStyler.subtitle)
    }
    
    func setData(_ viewModel: MovieDetailsBannerViewModelDataSource) {
        bannerImageView.loadImageWithPlaceholder(fromURL: viewModel.bannerURL)
        posterImageView.loadImageWithPlaceholder(fromURL: viewModel.posterURL, cornerRadius: 8)
        
        titleLabel.text = viewModel.title
        genreLabel.text = viewModel.genres
        releaseDateLabel.text = viewModel.releaseDate
    }
}

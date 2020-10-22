//
//  RecentlySearchedMovieTableViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class RecentlySearchedMovieTableViewCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        selectionStyle = .none
        UILabel.stylise(titleLabel, textStyle: TextStyler.searchResult)
        cardView.setBorder(color: .black, size: 1, cornerRadius: 4)
    }
    
    func setData(_ viewModel: RecentlySearchedMovieViewModel) {
        titleLabel.text = viewModel.title
        posterImageView.loadImageWithPlaceholder(fromURL: viewModel.posterURL)
    }
}

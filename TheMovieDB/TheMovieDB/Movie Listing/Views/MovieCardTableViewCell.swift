//
//  MovieCardTableViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieCardTableViewCell: UITableViewCell, NibLoadableView {
    @IBOutlet weak var mainView: MovieCardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        selectionStyle = .none
    }
    
    func setData(_ viewModel: MovieCardViewModeling) {
        mainView.setData(viewModel)
    }
}

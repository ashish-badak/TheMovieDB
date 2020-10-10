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
    
    weak var viewModel: MovieCardViewModelDelegate?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        bookNowButton.setTitleColor(.white, for: .normal)
        bookNowButton.backgroundColor = .blue
        bookNowButton.addTarget(self, action: #selector(bookButtonTapped), for: .touchUpInside)
    }
    
    func setData(_ viewModel: MovieCardViewModeling) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        releaseDateLabel.text = viewModel.releaseDate
        overviewLabel.text = viewModel.overview
        bookNowButton.setTitle(viewModel.bookButtonTitle, for: .normal)
    }
    
    @objc func bookButtonTapped() {
        print("Book Tapped")
        viewModel?.bookButtonActionHandler?()
    }
}

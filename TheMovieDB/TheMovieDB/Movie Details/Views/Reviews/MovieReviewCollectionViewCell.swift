//
//  MovieReviewCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieReviewCollectionViewCell: UICollectionViewCell {
    private let mainView: MovieReviewView = {
        let view = MovieReviewView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(mainView)
        mainView.layoutConstraints(superView: self)
    }
    
    func setData(_ viewModel: MovieReviewViewModel) {
        mainView.setData(viewModel)
    }
}

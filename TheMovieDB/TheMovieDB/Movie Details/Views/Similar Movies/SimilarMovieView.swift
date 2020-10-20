//
//  SimilarMovieView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class SimilarMovieView: UIView {
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.constrain(height: 150, width: 100)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        addSubview(posterImageView)
        
        let leadingConstraint = posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor)
        leadingConstraint.priority = .init(rawValue: 999)
        leadingConstraint.isActive = true
        
        let trailingConstraint = posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        trailingConstraint.priority = .init(rawValue: 999)
        trailingConstraint.isActive = true
        
        let topConstraint = posterImageView.topAnchor.constraint(equalTo: topAnchor)
        topConstraint.priority = .init(rawValue: 999)
        topConstraint.isActive = true
        
        let bottomConstraint = posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        bottomConstraint.isActive = true
        
        posterImageView.setBorder(color: UIColor.Border.image, size: 2, cornerRadius: 10)
    }
    
    func setData(_ viewModel: SimilarMovieViewModel) {
        posterImageView.loadImageWithPlaceholder(
            fromURL: viewModel.posterURL
        )
    }
}

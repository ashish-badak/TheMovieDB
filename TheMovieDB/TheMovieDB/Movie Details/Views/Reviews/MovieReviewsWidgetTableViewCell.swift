//
//  MovieReviewsWidgetTableViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieReviewsWidgetTableViewCell: UITableViewCell {
    private let collectionView: MovieReviewCollectionView = {
        let collectionView = MovieReviewCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 116).isActive = true
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        selectionStyle = .none
        contentView.addSubview(collectionView)
        
        let leadingConstraint = collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        leadingConstraint.priority = .init(rawValue: 999)
        leadingConstraint.isActive = true
        
        let trailingConstraint = collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        trailingConstraint.priority = .init(rawValue: 999)
        trailingConstraint.isActive = true
        
        let topConstraint = collectionView.topAnchor.constraint(equalTo: contentView.topAnchor)
        topConstraint.priority = .init(rawValue: 999)
        topConstraint.isActive = true
        
        let bottomConstraint = collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        bottomConstraint.isActive = true
    }
    
    func setData(movieReviewViewModels: [MovieReviewViewModel]) {
        collectionView.setData(movieReviewViewModels: movieReviewViewModels)
    }
}

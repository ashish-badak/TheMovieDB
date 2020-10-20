//
//  SimilarMoviesWidgetTableViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class SimilarMoviesWidgetTableViewCell: UITableViewCell {
    private let collectionView: SimilarMoviesCollectionView = {
        let collectionView = SimilarMoviesCollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.heightAnchor.constraint(equalToConstant: 166).isActive = true
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
        addSubview(collectionView)
        
        let leadingConstraint = collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        leadingConstraint.priority = .init(rawValue: 999)
        leadingConstraint.isActive = true
        
        let trailingConstraint = collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        trailingConstraint.priority = .init(rawValue: 999)
        trailingConstraint.isActive = true
        
        let topConstraint = collectionView.topAnchor.constraint(equalTo: topAnchor)
        topConstraint.priority = .init(rawValue: 999)
        topConstraint.isActive = true
        
        let bottomConstraint = collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        bottomConstraint.priority = .init(rawValue: 999)
        bottomConstraint.isActive = true
    }
    
    func setData(similarMoviesViewModels: [SimilarMovieViewModel]) {
        collectionView.setData(similarMovieViewModels: similarMoviesViewModels)
    }
}

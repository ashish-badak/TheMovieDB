//
//  MovieReviewView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieReviewView: UIView {
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        stackView.addArrangedSubview(authorLabel)
        stackView.addArrangedSubview(descriptionLabel)
        addSubview(stackView)
        stackView.layoutConstraints(
            superView: self,
            topConstant: 8,
            leadingConstant: 12,
            bottomConstant: 8,
            trailingConstant: 12
        )
        
        setBorder(
            color: UIColor.Border.primary,
            size: 1,
            cornerRadius: 5
        )
        
        setupLabels()
    }
    
    private func setupLabels() {
        UILabel.stylise(authorLabel, textStyle: TextStyler.reviewTitle)
        UILabel.stylise(descriptionLabel, textStyle: TextStyler.reviewDescription)
    }
    
    func setData(_ viewModel: MovieReviewViewModel) {
        authorLabel.text = viewModel.author
        descriptionLabel.text = viewModel.reviewDescription
    }
}

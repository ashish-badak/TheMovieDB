//
//  SimilarMovieCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class SimilarMovieCollectionViewCell: UICollectionViewCell {
    private let mainView: SimilarMovieView = {
        let view = SimilarMovieView()
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
    
    func setData(_ viewModel: SimilarMovieViewModel) {
        mainView.setData(viewModel)
    }
}

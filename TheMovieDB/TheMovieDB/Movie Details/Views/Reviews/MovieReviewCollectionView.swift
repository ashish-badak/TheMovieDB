//
//  MovieReviewCollectionView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieReviewCollectionView: UICollectionView {
    private var viewModels: [MovieReviewViewModel] = []

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 8, left: 16, bottom: 8, right: 16)
        layout.minimumInteritemSpacing = 8
        
        layout.itemSize = .init(width: UIScreen.main.bounds.width - 40, height: 100)
        
        super.init(
            frame: CGRect(
                x: .zero,
                y: .zero,
                width: UIScreen.main.bounds.width,
                height: 116
            ),
            collectionViewLayout: layout
        )
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    private func configureView() {
        backgroundColor = UIColor.Background.lists
        showsHorizontalScrollIndicator = false
        register(MovieReviewCollectionViewCell.self)
        dataSource = self
    }
    
    func setData(movieReviewViewModels: [MovieReviewViewModel]) {
        self.viewModels = movieReviewViewModels
        reloadData()
    }
}

extension MovieReviewCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieReviewCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setData(viewModels[indexPath.item])
        return cell
    }
}

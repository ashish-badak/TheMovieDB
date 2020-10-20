//
//  SimilarMoviesCollectionView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class SimilarMoviesCollectionView: UICollectionView {
    private var viewModels: [SimilarMovieViewModel] = []

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 8, left: 16, bottom: 8, right: 16)
        layout.minimumInteritemSpacing = 8
        
        layout.itemSize = .init(width: 100, height: 150)
        
        super.init(
            frame: CGRect(
                x: .zero,
                y: .zero,
                width: UIScreen.main.bounds.width,
                height: 166
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
        register(SimilarMovieCollectionViewCell.self)
        dataSource = self
    }
    
    func setData(similarMovieViewModels: [SimilarMovieViewModel]) {
        self.viewModels = similarMovieViewModels
        reloadData()
    }
}

extension SimilarMoviesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SimilarMovieCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.setData(viewModels[indexPath.item])
        return cell
    }
}

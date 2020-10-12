//
//  MovieCreditsCollectionView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieCreditsCollectionView: UICollectionView {
    var viewModels: [CastViewModel]?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 8, left: 16, bottom: 8, right: 16)
        layout.minimumInteritemSpacing = 16
        
        layout.itemSize = .init(width: 250, height: 80)
            
        collectionViewLayout = layout
        
        showsHorizontalScrollIndicator = false
        register(MovieCreditsCollectionViewCell.self)
        
        dataSource = self
    }
    
    func setData(creditViewModels: [CastViewModel]) {
        viewModels = creditViewModels
        reloadData()
    }
}

extension MovieCreditsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModels?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCreditsCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        
        if let vm = viewModels?[indexPath.item] {
            cell.setData(viewModel: vm)
        }
        
        return cell
    }
}

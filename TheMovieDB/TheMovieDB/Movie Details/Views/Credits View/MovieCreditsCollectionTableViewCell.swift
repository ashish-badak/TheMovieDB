//
//  MovieCreditsCollectionTableViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieCreditsCollectionTableViewCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet weak var collectionView: MovieCreditsCollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        
    }
}

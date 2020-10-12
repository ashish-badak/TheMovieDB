//
//  MovieCreditsCollectionViewCell.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieCreditsCollectionViewCell: UICollectionViewCell, NibLoadableView {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
    func configureView() {
        UILabel.stylise(nameLabel, textStyle: TextStyler.subtitle)
        UILabel.stylise(roleLabel, textStyle: TextStyler.trival)
        setBorder(color: UIColor.Border.secondary, size: 1, cornerRadius: 10)
    }
    
    func setData(viewModel: MovieCreditViewModelDataSource) {
        nameLabel.text = viewModel.personName
        roleLabel.text = viewModel.personRole
        
        profileImageView.loadRoundedImage(fromURL: viewModel.profilePictureURL)
    }
}

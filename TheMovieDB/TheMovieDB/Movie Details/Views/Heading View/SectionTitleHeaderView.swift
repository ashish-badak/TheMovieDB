//
//  SectionTitleHeaderView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class SectionTitleHeaderView: UITableViewHeaderFooterView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        contentView.backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.layoutConstraints(
            superView: self,
            topConstant: 0,
            leadingConstant: 16,
            bottomConstant: 0,
            trailingConstant: 16
        )
        
        UILabel.stylise(titleLabel, textStyle: TextStyler.title)
    }
    
    func setData(_ viewModel: HeadingViewModel) {
        titleLabel.text = viewModel.heading
    }
}

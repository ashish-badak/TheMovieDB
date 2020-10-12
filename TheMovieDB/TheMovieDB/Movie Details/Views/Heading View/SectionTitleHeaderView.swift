//
//  SectionTitleHeaderView.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 12/10/20.
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
        UILabel.stylise(titleLabel, textStyle: TextStyler.title)
    }
    
    func setData(_ viewModel: HeadingViewModel) {
        titleLabel.text = viewModel.heading
    }
}

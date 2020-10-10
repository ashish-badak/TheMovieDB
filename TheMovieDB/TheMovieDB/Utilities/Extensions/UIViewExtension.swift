//
//  UIViewExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

extension UIView {
    func layoutConstraints(
        superView: UIView,
        topConstant: CGFloat = 0.0,
        leadingConstant: CGFloat = 0.0,
        bottomConstant: CGFloat = 0.0,
        trailingConstant: CGFloat = 0.0
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: topConstant).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: leadingConstant).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -bottomConstant).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -trailingConstant).isActive = true
    }
    
    func constrain(height: CGFloat, width: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}

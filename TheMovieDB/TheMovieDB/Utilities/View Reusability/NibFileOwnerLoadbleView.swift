//
//  NibFileOwnerLoadbleView.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol NibFileOwnerLoadbleView: NibLoadableView {
    func loadFromNib()
}

extension NibFileOwnerLoadbleView where Self: UIView {
    private func instantiateFromNib() -> UIView? {
        let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }
    
    func loadFromNib() {
        guard let contentView = instantiateFromNib() else {
            fatalError("Failed to instantiate \(Self.nibName).xib")
        }
        
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleWidth, .flexibleHeight]
    }
}


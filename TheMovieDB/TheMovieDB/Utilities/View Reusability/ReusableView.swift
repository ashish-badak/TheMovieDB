//
//  ReusableView.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol ReusableView: AnyObject { }

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String { String(describing: self) }
}

extension UITableViewCell: ReusableView { }

extension UITableViewHeaderFooterView: ReusableView { }

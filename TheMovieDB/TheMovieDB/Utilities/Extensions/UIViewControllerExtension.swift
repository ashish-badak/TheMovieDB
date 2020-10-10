//
//  UIViewControllerExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(childViewController: UIViewController, parentView: UIView) {
        addChild(childViewController)
        parentView.addSubview(childViewController.view)
        childViewController.view.frame = parentView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        childViewController.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

//
//  ActivityStateViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class ActivityStateViewController: UIViewController {
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .gray)
        activityView.hidesWhenStopped = true
        return activityView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if parent == nil {
            removeActivityIndicator()
        }
    }
    
    override func didMove(toParent parent: UIViewController?) {
        if parent != nil {
            showActivityIndicator()
        }
    }
    
    deinit {
        removeActivityIndicator()
    }
    
    private func showActivityIndicator() {
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
    }
    
    private func removeActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}

//
//  MovieSearchViewController.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieSearchViewController: UIViewController {
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.constrain(height: 44, width: UIScreen.main.bounds.width)
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .white
        configureSearchBar()
    }
    
    private func configureSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        searchBar.placeholder = "Search Movie Name"
        searchBar.becomeFirstResponder()
    }
}

//
//  MovieListViewCoordinator.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieListViewCoordinator: NSObject, Coordinator {
    private let presenter: UINavigationController
    private var movieListViewController: MovieListingViewController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let movieListViewController = MovieListingViewController.instantiate()
        movieListViewController.title = "Now Playing"
        presenter.pushViewController(movieListViewController, animated: true)
        
        self.movieListViewController = movieListViewController
    }
}

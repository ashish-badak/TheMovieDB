//
//  MovieDetailsCoordinator.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieDetailsCoordinator: NSObject, Coordinator {
    private let presenter: UINavigationController
    private var movieDetailsViewController: MovieDetailsViewController?
    
    var movie: Movie

    init(presenter: UINavigationController, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
    }
    
    func start() {
        let movieDetailsViewController = MovieDetailsViewController.instantiate()
        movieDetailsViewController.title = movie.title
        presenter.pushViewController(movieDetailsViewController, animated: true)
        self.movieDetailsViewController = movieDetailsViewController
    }
}

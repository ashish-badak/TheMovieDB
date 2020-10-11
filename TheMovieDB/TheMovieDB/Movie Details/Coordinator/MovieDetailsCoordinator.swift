//
//  MovieDetailsCoordinator.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 11/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieDetailsCoordinator: NSObject, Coordinator {
    weak var parentCoordinator: Coordinator?
    private let presenter: UINavigationController
    private var movieDetailsViewController: MovieDetailsViewController?
    
    var childCoordinators = [Coordinator]()
    
    var movie: Movie

    init(presenter: UINavigationController, movie: Movie) {
        self.presenter = presenter
        self.movie = movie
        super.init()
        presenter.delegate = self
    }
    
    func start() {
        let movieDetailsViewController = MovieDetailsViewController.instantiate()
        movieDetailsViewController.title = movie.title
        presenter.pushViewController(movieDetailsViewController, animated: true)
        self.movieDetailsViewController = movieDetailsViewController
    }
}

extension MovieDetailsCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if fromViewController is MovieDetailsViewController {
            parentCoordinator?.removeChild(coordinator: self)
        }
    }
}

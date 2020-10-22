//
//  MovieSearchCoordinator.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieSearchCoordinator: NSObject, Coordinator {
    private let presenter: UINavigationController
    var childCoordinators: [Coordinator] = []
    weak var parentCoordinator: Coordinator?
    var searchViewController: MovieSearchViewController?
    
    let movieIndexer: MovieIndexer
    let recentlySearchedCache: LRUCache<Int, Movie>

    weak var searchResultsDelegate: MovieSearchViewDelegate?
    
    init(
        presenter: UINavigationController,
        movieIndexer: MovieIndexer,
        cache: LRUCache<Int, Movie>
    ) {
        self.presenter = presenter
        self.movieIndexer = movieIndexer
        self.recentlySearchedCache = cache
        super.init()
        self.presenter.delegate = self
    }
    
    func start() {
        let movies = recentlySearchedCache.getAllValues()
        let searchViewController = MovieSearchViewController(recentlySearchedMovies: movies, movieIndexer: movieIndexer)
        self.searchViewController = searchViewController
        searchViewController.title = "Search Movie"
        searchViewController.coordinatorDelegate = self
        presenter.pushViewController(searchViewController, animated: true)
    }
}

extension MovieSearchCoordinator: MovieSearchViewDelegate {
    func didSelect(movie: Movie) {
        recentlySearchedCache.setValue(movie, for: movie.id)
        presenter.popViewController(animated: false)
        searchResultsDelegate?.didSelect(movie: movie)
    }
}

extension MovieSearchCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if fromViewController is MovieSearchViewController {
            parentCoordinator?.removeChild(coordinator: self)
        }
    }
}

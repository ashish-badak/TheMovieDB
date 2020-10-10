//
//  MovieListViewCoordinator.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class MovieListViewCoordinator: NSObject, Coordinator {
    private let presenter: UINavigationController
    private var movieListViewController: MovieListingViewController?
    
    /// Contained child-controllers
    lazy var activityIndicatorController = ActivityStateViewController()
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let movieListViewController = MovieListingViewController.instantiate()
        movieListViewController.title = "Now Playing"
        movieListViewController.coordinatorDelgate = self
        presenter.pushViewController(movieListViewController, animated: true)
        self.movieListViewController = movieListViewController
    }
}

extension MovieListViewCoordinator: MovieListContainerDelegate {
    func didStartContentFetching(isPaginated: Bool) {
        guard !isPaginated, let viewController = movieListViewController else {
            return
        }
        
        DispatchQueue.main.async {
            viewController.add(
                childViewController: self.activityIndicatorController,
                parentView: viewController.view
            )
        }
    }
    
    func didFetchContent(isPaginated: Bool, result: Result<ResponseList<Movie>, Error>) {
        
        DispatchQueue.main.async {
            self.activityIndicatorController.remove()
        }
        
        switch result {
        case .success(let list):
            if !list.results.isEmpty {
                loadMovieListContentController(with: list)
            } else if !isPaginated {
                loadErrorStateController(errorMessage: "No Movies Found")
            }
                        
        case .failure(let error):
            guard !isPaginated else { return }
            
            var errorMessage = error.localizedDescription
            if let apiError = error as? APIRequestError {
                errorMessage = apiError.description
            }
            
            loadErrorStateController(errorMessage: errorMessage)
        }
    }
    
    private func loadMovieListContentController(with movieList: ResponseList<Movie>) {
        guard let viewController = movieListViewController else {
            return
        }
        
        DispatchQueue.main.async {
            let controller = MovieListingContentViewController(movieList: movieList)
            viewController.add(childViewController: controller, parentView: viewController.view)
        }
    }
    
    private func loadErrorStateController(errorMessage: String) {
        guard let viewController = movieListViewController else {
            return
        }
        DispatchQueue.main.async {
            let controller = ErrorStateViewController(errorMessage: errorMessage)
            viewController.add(childViewController: controller, parentView: viewController.view)
        }
    }
}

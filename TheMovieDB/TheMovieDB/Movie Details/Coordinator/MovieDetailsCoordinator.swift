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
    
    /// Contained child-controllers
    private var movieDetailsContentViewController: MovieDetailsContentViewController?
    private lazy var activityIndicatorController = ActivityStateViewController()
    
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
        movieDetailsViewController.movieId = movie.id
        movieDetailsViewController.delegate = self
        presenter.pushViewController(movieDetailsViewController, animated: true)
        self.movieDetailsViewController = movieDetailsViewController
    }
}

extension MovieDetailsCoordinator: MovieDetailsContainerDelegate {
    func setErrorState(errorMessage: String) {
        loadErrorStateController(errorMessage: errorMessage)
    }
    
    func didStartContentFetching() {
        guard let viewController = movieDetailsViewController else {
            return
        }
        
        DispatchQueue.main.async {
            viewController.add(
                childViewController: self.activityIndicatorController,
                parentView: viewController.view
            )
        }
    }
    
    func didFetchContent(result: Result<MovieDetailsDataContainer, Error>) {
        DispatchQueue.main.async {
            self.activityIndicatorController.remove()
        }
        
        switch result {
        case .success(let dataContainer):
            loadMovieDetailsContentViewController(with: dataContainer)
                        
        case .failure(let error):
            var errorMessage = error.localizedDescription
            if let apiError = error as? APIRequestError {
                errorMessage = apiError.description
            }
            
            loadErrorStateController(errorMessage: errorMessage)
        }
    }
    
    private func loadMovieDetailsContentViewController(with dataContainer: MovieDetailsDataContainer) {
        guard let viewController = movieDetailsViewController else {
            return
        }
        
        DispatchQueue.main.async {
            let controller = MovieDetailsContentViewController(dataContainer: dataContainer)
            controller.coordinatorDelegate = self
            viewController.add(childViewController: controller, parentView: viewController.view)
            self.movieDetailsContentViewController = controller
        }
    }
    
    private func loadErrorStateController(errorMessage: String) {
        guard let viewController = movieDetailsViewController else {
            return
        }
        DispatchQueue.main.async {
            let controller = ErrorStateViewController(errorMessage: errorMessage)
            viewController.add(childViewController: controller, parentView: viewController.view)
        }
    }
}

extension MovieDetailsCoordinator: MovieDetailsContentDelegate {
    func didSelect(movie: Movie) {
        let movieDetailsCoordinator = MovieDetailsCoordinator(presenter: presenter, movie: movie)
        movieDetailsCoordinator.start()
        movieDetailsCoordinator.parentCoordinator = self
        self.childCoordinators.append(movieDetailsCoordinator)
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

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
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        super.init()
        self.presenter.delegate = self
    }
    
    func start() {
        let searchViewController = MovieSearchViewController()
        self.searchViewController = searchViewController
        searchViewController.title = "Search Movie"
        presenter.pushViewController(searchViewController, animated: true)
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

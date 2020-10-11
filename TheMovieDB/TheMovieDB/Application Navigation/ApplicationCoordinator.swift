//
//  ApplicationCoordinator.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    weak private var window: UIWindow?
    let rootViewController: UINavigationController

    var childCoordinators = [Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
    }
    
    func start() {
        let movieListCoordinator = MovieListViewCoordinator(presenter: rootViewController)
        childCoordinators.append(movieListCoordinator)
        window?.rootViewController = rootViewController
        movieListCoordinator.start()
        window?.makeKeyAndVisible()
    }
}

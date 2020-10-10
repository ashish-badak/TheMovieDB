//
//  ApplicationCoordinator.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    let rootViewController: UINavigationController
    var movieListCoordinator: MovieListViewCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        
        let movieListCoordinator = MovieListViewCoordinator(presenter: rootViewController)
        self.movieListCoordinator = movieListCoordinator
    }
    
    func start() {
        window.rootViewController = rootViewController
        movieListCoordinator.start()
        window.makeKeyAndVisible()
    }
}

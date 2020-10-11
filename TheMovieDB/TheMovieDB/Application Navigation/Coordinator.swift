//
//  Coordinator.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
    func removeChild(coordinator: Coordinator)
}

extension Coordinator {
    func removeChild(coordinator: Coordinator) {
        for (index, child) in childCoordinators.enumerated() {
            guard child === coordinator else { return }
            childCoordinators.remove(at: index)
            break
        }
    }
}

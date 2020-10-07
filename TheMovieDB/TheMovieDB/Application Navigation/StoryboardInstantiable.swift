//
//  StoryboardInstantiable.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboardProvider: StoryboardProvider { get }
    static func instantiate() -> Self
}

extension StoryboardInstantiable where Self: UIViewController {
    static var storyboardIdentifier: String { String(describing: self) }
    
    static func instantiate() -> Self {
        let storyboard = storyboardProvider.getStoryboard()
        guard let viewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else {
            fatalError("Failed to load \(storyboardIdentifier) from \(storyboardProvider.storyboardName) storyboard.")
        }
        return viewController
    }
}

//
//  StoryboardProvider.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol StoryboardProvider {
    var storyboardName: String { get }
    var storyboardBundle: Bundle? { get }
    func getStoryboard() -> UIStoryboard
}

extension StoryboardProvider {
    var storyboardBundle: Bundle? { .main }
    
    func getStoryboard() -> UIStoryboard {
        UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
}

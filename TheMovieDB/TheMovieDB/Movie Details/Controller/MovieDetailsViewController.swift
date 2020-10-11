//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController, StoryboardInstantiable {
    static var storyboardProvider: StoryboardProvider { Storyboard.movieDetails }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

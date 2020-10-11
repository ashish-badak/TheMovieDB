//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol MovieDetailsContainerDelegate: AnyObject {
    func setErrorState(errorMessage: String)
    func didStartContentFetching()
    func didFetchContent(result: Result<MovieDetailsDataContainer, Error>)
}

class MovieDetailsViewController: UIViewController, StoryboardInstantiable {
    static var storyboardProvider: StoryboardProvider { Storyboard.movieDetails }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

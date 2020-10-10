//
//  MovieListingViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

protocol MovieListContainerDelegate: AnyObject {
    func didStartContentFetching(isPaginated: Bool)
    func didFetchContent(isPaginated: Bool, result: Result<ResponseList<Movie>, Error>)
}

class MovieListingViewController: UIViewController, StoryboardInstantiable {
    static var storyboardProvider: StoryboardProvider { Storyboard.movieListing }

    var contentProvider: MovieListContentProvider!
    weak var coordinatorDelgate: MovieListContainerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentProvider = MovieListContentProvider()
        getMovieList()
    }
    
    func getMovieList() {
        let isPaginatedRequest = contentProvider.isPaginatedRequest()
        coordinatorDelgate?.didStartContentFetching(isPaginated: isPaginatedRequest)
        contentProvider.fetchContent { [weak self] (result) in
            self?.coordinatorDelgate?.didFetchContent(
                isPaginated: isPaginatedRequest,
                result: result
            )
        }
    }
}

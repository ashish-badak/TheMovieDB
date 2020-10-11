//
//  MovieDetailsViewController.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
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

    var movieId: Int?
    var contentProvider: MovieDetailsContentProvider?
    
    weak var delegate: MovieDetailsContainerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id = movieId {
            fetchContent(movieId: id)
        } else {
            delegate?.setErrorState(errorMessage: "Something went wrong!")
        }
    }
    
    func fetchContent(movieId: Int) {
        self.delegate?.didStartContentFetching()
        contentProvider = MovieDetailsContentProvider(movieId: movieId)
        contentProvider?.fetchContent(completion: { [weak self] (result) in
            self?.delegate?.didFetchContent(result: result)
        })
    }
}

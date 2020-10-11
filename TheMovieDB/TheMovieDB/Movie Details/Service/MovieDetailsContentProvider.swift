//
//  MovieDetailsContentProvider.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class MovieDetailsContentProvider {
    let movieId: Int
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    func fetchContent(completion: @escaping (Result<MovieDetailsDataContainer, Error>) -> Void) {
        let dispatchGroup = DispatchGroup()

        var movieResult: Result<Movie, Error>?
        var credits: Credits?
        var similarMovies: ResponseList<Movie>?
        var reviews: ResponseList<Review>?
        
        DispatchQueue.global(qos: .userInitiated).async { [movieId] in
            let requestManager = MovieDetailsRequestManager()
            
            dispatchGroup.enter()
            requestManager.getMovieDetails(id: movieId) { (result) in
                movieResult = result
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            requestManager.getMovieCredits(id: movieId) { (result) in
                if case .success(let value) = result {
                    credits = value
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            requestManager.getSimilarMovies(id: movieId, page: 1) { (result) in
                if case .success(let value) = result {
                    similarMovies = value
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.enter()
            requestManager.getMovieReviews(id: movieId, page: 1) { (result) in
                if case .success(let value) = result {
                    reviews = value
                }
                dispatchGroup.leave()
            }
            
            dispatchGroup.notify(queue: .main) {
                guard let movieResult = movieResult else {
                    completion(.failure(APIRequestError.noData))
                    return
                }
                
                switch movieResult {
                case .success(let movie):
                    let dataContainer = MovieDetailsDataContainer(
                        movie: movie,
                        credits: credits,
                        similarMovies: similarMovies,
                        reviews: reviews
                    )
                    completion(.success(dataContainer))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
        
    }
}

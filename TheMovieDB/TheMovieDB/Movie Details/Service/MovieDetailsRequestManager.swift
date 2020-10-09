//
//  MovieDetailsRequestManager.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieDetailsRequestManager {
    func getMovieDetails(id: Int, then perform: @escaping (Result<Movie, Error>) -> Void) {
        let requestEndPoint = MovieDetailsRequestEndPoint(id: id)
        RestClient<Movie>().get(requestEndPoint: requestEndPoint) { (result) in
            perform(result)
        }
    }
    
    func getMovieCredits(id: Int, then perform: @escaping (Result<Movie, Error>) -> Void) {
        let requestEndPoint = MovieCreditsRequestEndPoint(id: id)
        RestClient<Credits>().get(requestEndPoint: requestEndPoint) { (result) in
            perform(result)
        }
    }
    
    func getMovieReviews(id: Int, page: Int, then perform: @escaping (Result<ResponseList<Review>, Error>) -> Void) {
        let requestEndPoint = MovieReviewsRequestEndPoint(id: id, page: page)
        RestClient<ResponseList<Review>>().get(requestEndPoint: requestEndPoint) { (result) in
            perform(result)
        }
    }
    
    func getSimilarMovies(id: Int, page: Int, then perform: @escaping (Result<ResponseList<Movie>, Error>) -> Void) {
        let requestEndPoint = SimilarMoviesRequestEndPoint(id: id, page: page)
        RestClient<ResponseList<Movie>>().get(requestEndPoint: requestEndPoint) { (result) in
            perform(result)
        }
    }
}

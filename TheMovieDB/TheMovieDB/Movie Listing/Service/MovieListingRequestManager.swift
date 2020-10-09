//
//  MovieListingRequestManager.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieListingRequestManager {
    func getMovies(page: Int, then perform: @escaping (Result<MovieList, Error>) -> Void) {
        let requestEndPoint = MovieListingRequestEndPoint(page: page)
        RestClient<MovieList>().get(requestEndPoint: requestEndPoint) { result in
            perform(result)
        }
    }
}

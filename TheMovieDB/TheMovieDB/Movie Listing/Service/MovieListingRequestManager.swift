//
//  MovieListingRequestManager.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieListingRequestManager {
    func getMovies(page: Int, then perform: @escaping (Result<ResponseList<Movie>, Error>) -> Void) {
        let requestEndPoint = MovieListingRequestEndPoint(page: page)
        RestClient<ResponseList<Movie>>().get(requestEndPoint: requestEndPoint) { result in
            perform(result)
        }
    }
}


final class MovieListContentProvider {
    var requestPage: Int = 0
    
    func fetchContent(completion: @escaping (Result<ResponseList<Movie>, Error>) -> Void) {
        requestPage += 1
        let requestManager = MovieListingRequestManager()
        
        requestManager.getMovies(page: requestPage) { [weak self] (result) in
            if case .failure = result {
                self?.requestPage -= 1
            }
            completion(result)
        }
    }
    
    func isPaginatedRequest() -> Bool {
        requestPage > 0
    }
}

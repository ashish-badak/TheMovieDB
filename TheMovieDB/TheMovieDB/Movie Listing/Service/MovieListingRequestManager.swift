//
//  MovieListingRequestManager.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieListingRequestManager {
    /// - TODO: add callback once mapping done
    func getMovies(page: Int) {
        let requestEndPoint = MovieListingRequestEndPoint(page: page)
        let requestBuilder = RequestBuilder(endPoint: requestEndPoint)
        
        RestClient().request(requestBuilder) { (result) in
            switch result {
            case .success(let data):
                print("String: ", String(data: data, encoding: .utf8) ?? "No Value")
            case .failure(let error):
                print("Error: ", error.localizedDescription)
            }
        }
    }
}


//
//  MovieListingRequestEndPoint.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieListingRequestEndPoint: GetRequestEndPoint {
    var path: String { "movie/now_playing" }
    var extraHeaders: HTTPHeaders?
        
    var parameters: Parameters { queryParams.getQueryParameters() }
    
    var page: Int
    var queryParams: PaginatedQueryParamsProvider {
        .init(page: page)
    }
}

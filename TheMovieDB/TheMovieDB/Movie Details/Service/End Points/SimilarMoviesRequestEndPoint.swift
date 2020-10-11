//
//  SimilarMoviesRequestEndPoint.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct SimilarMoviesRequestEndPoint: GetRequestEndPoint {
    var path: String { "movie/\(id)/similar" }
    var extraHeaders: HTTPHeaders? { nil }
    
    var parameters: Parameters {
        PaginatedQueryParamsProvider(page: page).getQueryParameters()
    }
    
    var id: Int
    var page: Int
}

//
//  MovieReviewsRequestEndPoint.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieReviewsRequestEndPoint: GetRequestEndPoint {
    var path: String { "movie/\(id)/reviews" }
    var extraHeaders: HTTPHeaders? { nil }
    
    var parameters: Parameters {
        PaginatedQueryParamsProvider(page: page).getQueryParameters()
    }
    
    var id: Int
    var page: Int
}

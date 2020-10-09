//
//  MovieDetailsRequestEndPoint.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieDetailsRequestEndPoint: GetRequestEndPoint {
    var path: String { "movie/\(id)" }
    var extraHeaders: HTTPHeaders? { nil }
    
    var parameters: Parameters {
        BasicQueryParametersProvider().getQueryParameters()
    }
    
    var id: Int
}

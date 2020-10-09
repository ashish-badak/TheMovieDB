//
//  ResponseList.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct ResponseList<T: Decodable>: Decodable {
    var page: Int
    var totalPages: Int
    var totalResults: Int
    var results: [T]
}

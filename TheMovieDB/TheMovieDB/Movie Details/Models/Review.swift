//
//  Review.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct Review: Codable {
    var id: String
    var author: String
    var content: String
    var url: String
}

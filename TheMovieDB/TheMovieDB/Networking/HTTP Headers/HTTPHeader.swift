//
//  HTTPHeader.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct HTTPHeader {
    var key: String
    var value: String
}

extension HTTPHeader {
    static var contentType: Self {
        .init(key: "content-type", value: "application/json")
    }
}

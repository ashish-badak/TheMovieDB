//
//  HTTPHeaderProvider.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol HTTPHeaderProvider {
    func getHeaders() -> HTTPHeaders
}

struct DefaultHeaderProvider: HTTPHeaderProvider {
    func getHeaders() -> HTTPHeaders {
        [HTTPHeader.contentType.key: HTTPHeader.contentType.value]
    }
}

//
//  NetworkError.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case missingURL
    case encodingFailure
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .missingURL:
            return "URL is not present or invalid"
        case .encodingFailure:
            return "URL parameter encoding failed"
        }
    }
}

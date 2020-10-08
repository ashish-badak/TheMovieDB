//
//  APIRequestError.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

enum APIRequestError: Error {
    case authenticationError
    case badRequest
    case outdated
    case failed
    case invalidResponse
    case noData
}

extension APIRequestError: CustomStringConvertible {
    var description: String {
        switch self {
        case .authenticationError:
            return "Authentication failure."
        case .badRequest:
            return "UhOh! Bad Request."
        case .outdated:
            return "The url you requested is outdated."
        case .failed:
            return "Network request failed."
        case .invalidResponse:
            return "Failed to parse response"
        case .noData:
            return "Did not receive Data"
        }
    }
}

//
//  URLParameterEncoder.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct URLParameterEncoder: ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else {
            throw NetworkError.missingURL
        }
        
        guard !parameters.isEmpty else {
            return
        }
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return
        }
        
        urlComponents.queryItems = parameters.asURLQueryItems
        urlRequest.url = urlComponents.url
    }
}

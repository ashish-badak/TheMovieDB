//
//  RequestBuilder.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest?
}

struct RequestBuilder: URLRequestConvertible {
    let endPoint: RequestEndPoint
    let cachePolicy: URLRequest.CachePolicy
    let timeoutInterval: TimeInterval
    
    func asURLRequest() -> URLRequest? {
        var urlRequest = URLRequest(
            url: endPoint.baseURL.appendingPathComponent(endPoint.path),
            cachePolicy: cachePolicy,
            timeoutInterval: timeoutInterval
        )
        
        urlRequest.httpMethod = endPoint.httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = endPoint.getHeaders()
        
        do {
            try endPoint.encoder.encode(urlRequest: &urlRequest, with: endPoint.parameters)
        } catch {
            /// - Note: We can throw an error from here as well if required
            debugPrint("Failed to encode URL")
        }
        
        return urlRequest
    }
}

extension RequestBuilder {
    init(endPoint: RequestEndPoint) {
        cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        timeoutInterval = 10.0
        self.endPoint = endPoint
    }
}

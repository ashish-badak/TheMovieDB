//
//  RequestEndPoint.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias HTTPHeaders = [String: String]

protocol RequestEndPoint {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    
    var extraHeaders: HTTPHeaders? { get }
    var parameters: Parameters { get }
    
    var encoder: ParameterEncoder { get }
}

extension RequestEndPoint {
    func getHeaders() -> HTTPHeaders {
        var allHTTPHeaders = DefaultHeaderProvider().getHeaders()
        
        if let extraHeaders = extraHeaders, !extraHeaders.isEmpty {
            /// request specific headers can be provided in extraHeaders
            /// those shall overwrite default ones
            /// so merging by giving preference to extraHeaders (i.e. $1)
            allHTTPHeaders = allHTTPHeaders.merging(extraHeaders) { $1 }
        }
        
        return allHTTPHeaders
    }
    
    var baseURL: URL { URL.TMDB.baseURL }
}

protocol GetRequestEndPoint: RequestEndPoint { }

extension GetRequestEndPoint {
    var httpMethod: HTTPMethod { .get }
    var encoder: ParameterEncoder { URLParameterEncoder() }
}

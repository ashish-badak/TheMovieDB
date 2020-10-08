//
//  RequestEndPoint.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
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

//
//  RequestPerformer.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

typealias APIRequestCallback = (Data?, URLResponse?, Error?) -> Void

protocol RequestPerformer {
    func perform(_ requestBuilder: URLRequestConvertible, then perform: @escaping APIRequestCallback)
}

final class DefaultRequestPerformer: RequestPerformer {
    private var task: URLSessionTask?
    
    func perform(_ requestBuilder: URLRequestConvertible, then perform: @escaping APIRequestCallback) {
        guard let request = requestBuilder.asURLRequest() else {
            perform(nil, nil, NetworkError.missingURL)
            return
        }
        
        task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            perform(data, response, error)
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}

//
//  RequestPerformer.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

typealias APIRequestCallback = (Result<Data, Error>) -> Void

protocol RequestPerformer {
    func perform(_ requestBuilder: URLRequestConvertible, then perform: @escaping APIRequestCallback)
}

final class DefaultRequestPerformer: RequestPerformer {
    var task: URLSessionTask?
    let responseValidator: APIResponseValidator
    
    init(responseValidator: APIResponseValidator) {
        self.responseValidator = responseValidator
    }
    
    convenience init() {
        self.init(responseValidator: DefaultAPIResponseValidator())
    }
    
    func perform(_ requestBuilder: URLRequestConvertible, then perform: @escaping APIRequestCallback) {
        guard let request = requestBuilder.asURLRequest() else {
            perform(.failure(APIRequestError.badRequest))
            return
        }
        
        task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            /// - TODO: Handle response validation and error mapping
        }
        task?.resume()
    }
    
    func cancel() {
        task?.cancel()
    }
}

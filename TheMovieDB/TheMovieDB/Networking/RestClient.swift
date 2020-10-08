//
//  RestClient.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class RestClient {
    let requestPerformer: RequestPerformer
    let responseValidator: APIResponseValidator
    
    init(requestPerformer: RequestPerformer, responseValidator: APIResponseValidator) {
        self.requestPerformer = requestPerformer
        self.responseValidator = responseValidator
    }
    
    convenience init() {
        self.init(
            requestPerformer: DefaultRequestPerformer(),
            responseValidator: DefaultAPIResponseValidator()
        )
    }
    
    func request(
        _ requestBuilder: URLRequestConvertible,
        then perform: @escaping (Result<Data, Error>) -> Void
    ) {
        requestPerformer.perform(requestBuilder) { (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else {
                perform(.failure(APIRequestError.invalidResponse))
                return
            }
            
            let result = self.responseValidator.validate(response: response)
            
            switch result {
            case .success:
                if let data = data {
                    perform(.success(data))
                } else {
                    perform(.failure(APIRequestError.noData))
                }
                
            case .failure(let error):
                perform(.failure(error))
            }
        }
    }
}

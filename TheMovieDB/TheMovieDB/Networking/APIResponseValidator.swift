//
//  APIResponseValidator.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol APIResponseValidator {
    func validate(response: HTTPURLResponse) -> Result<Bool, APIRequestError>
}

extension APIResponseValidator {
    func validate(response: HTTPURLResponse) -> Result<Bool, APIRequestError> {
        switch response.statusCode {
        case 200...299: return .success(true)
        case 401...500: return .failure(.authenticationError)
        case 501...599: return .failure(.badRequest)
        case 600: return .failure(.outdated)
        default: return .failure(.failed)
        }
    }
}

struct DefaultAPIResponseValidator: APIResponseValidator { }

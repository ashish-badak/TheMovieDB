//
//  JSONParameterEncoder.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct JSONParameterEncoder: ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonData = try parameters.asData()
            urlRequest.httpBody = jsonData
        } catch {
            throw NetworkError.encodingFailure
        }
    }
}

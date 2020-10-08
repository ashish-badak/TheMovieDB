//
//  ParameterEncoding.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

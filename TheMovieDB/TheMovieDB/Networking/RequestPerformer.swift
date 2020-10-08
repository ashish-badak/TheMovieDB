//
//  RequestPerformer.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

typealias APIRequestCallback = (Result<Data, Error>) -> Void

protocol RequestPerformer {
    func perform(_ requestBuilder: URLRequestConvertible, then perform: @escaping APIRequestCallback)
}

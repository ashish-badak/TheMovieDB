//
//  QueryParamsProvider.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol QueryParamsProvider {
    var apiKey: String { get }
    var contentLanguage: String { get }
    func getQueryParameters() -> Parameters
}

extension QueryParamsProvider {
    var apiKey: String { Constants.apiKey }
    var contentLanguage: String { Constants.contentLanguage }
}

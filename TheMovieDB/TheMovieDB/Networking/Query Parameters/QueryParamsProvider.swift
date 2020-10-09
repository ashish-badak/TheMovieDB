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
    var contnetLanguage: String { get }
    func getQueryParameters() -> Parameters
}

extension QueryParamsProvider {
    var apiKey: String { Constants.apiKey }
    var contnetLanguage: String { Constants.contnetLanguage }
}

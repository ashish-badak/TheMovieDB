//
//  BasicQueryParamsProvider.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

class BasicQueryParametersProvider: QueryParamsProvider {
    enum Keys {
        static var apiKey: String { "api_key" }
        static var contentLanguage: String { "language" }
    }
    
    func getQueryParameters() -> Parameters {
        [
            Keys.apiKey: apiKey,
            Keys.contentLanguage: contentLanguage
        ]
    }
}

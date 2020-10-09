//
//  PaginatedQueryParamsProvider.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

class PaginatedQueryParamsProvider: BasicQueryParametersProvider {
    var page: Int
    
    init(page: Int) {
        self.page = page
    }
    
    enum Keys {
        static var page: String { "page" }
    }
    
    override func getQueryParameters() -> Parameters {
        var parameters = super.getQueryParameters()
        parameters[Keys.page] = page
        return parameters
    }
}

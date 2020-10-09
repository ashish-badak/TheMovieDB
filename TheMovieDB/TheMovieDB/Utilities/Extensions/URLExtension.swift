//
//  URLExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

extension URL {
    enum TMDB {
        static var baseURL: URL { URL(string: "https://api.themoviedb.org/3/")! }
    }
}

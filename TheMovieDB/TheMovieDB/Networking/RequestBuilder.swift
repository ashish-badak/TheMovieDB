//
//  RequestBuilder.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol URLRequestConvertible {
    func asURLRequest() -> URLRequest?
}

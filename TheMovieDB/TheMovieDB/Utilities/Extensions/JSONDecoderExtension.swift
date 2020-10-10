//
//  JSONDecoderExtension.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

extension JSONDecoder {
    static var `default`: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(.serverDateFormatter)
        return jsonDecoder
    }
}

//
//  DictionaryExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

extension Dictionary {
    func asData() throws -> Data {
        try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}

extension Dictionary where Key == String {
    var asURLQueryItems: [URLQueryItem] {
        map {
            URLQueryItem(
                name: $0.key,
                value: "\($0.value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            )
        }
    }
}

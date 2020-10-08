//
//  DictionaryExtension.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

extension Dictionary {
    func asData() throws -> Data {
        try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}

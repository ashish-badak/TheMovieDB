//
//  Credits.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct Credits: Codable {
    var id: Int
    var cast: [Cast]
    var crew: [Crew]
}

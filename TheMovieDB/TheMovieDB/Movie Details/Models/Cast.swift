//
//  Cast.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct Cast: Codable {
    var id: Int
    var castId: Int
    var creditId: String
    
    var name: String
    var character: String
    var gender: Int?
    
    var order: Int
    var profilePath: String?
}

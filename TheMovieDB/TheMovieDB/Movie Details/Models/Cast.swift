//
//  Cast.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol Person {
    var name: String { get }
    var role: String { get }
    var profilePath: String? { get }
}

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

extension Cast: Person {
    var role: String {
        character
    }
}

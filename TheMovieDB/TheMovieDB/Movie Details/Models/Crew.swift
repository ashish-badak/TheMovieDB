//
//  Crew.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct Crew: Codable {
    var id: Int
    var creditId: String
    
    var name: String
    var gender: Int?
    
    var job: String
    var department: String
    
    var profilePath: String?
}

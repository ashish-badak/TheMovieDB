//
//  Movie.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct Movie: Codable {
    var id: Int
    var title: String
    var originalTitle: String
    var originalLanguage: String
    var overview: String?

    var backdropPath: String?

    var posterPath: String?
    var video: Bool
    
    var popularity: Double
    var voteCount: Int
    var voteAverage: Double

    var genreIds: [Int]?
    var genres: [Genre]?
    
    var releaseDate: Date
        
    var budget: Int?
    var revenue: Int?

    var adult: Bool
}

//
//  MovieDetailsDataContainer.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct MovieDetailsDataContainer {
    var movie: Movie
    var credits: Credits?
    var similarMovies: ResponseList<Movie>?
    var reviews: ResponseList<Review>?
}

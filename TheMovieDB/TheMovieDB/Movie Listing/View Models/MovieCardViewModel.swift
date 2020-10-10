//
//  MovieCardViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class MovieCardViewModel {
    let posterURL: String
    let title: String
    let releaseDate: String
    let overview: String
    
    var bookNowActionHandler: (() -> Void)?
    
    init(movie: Movie) {
        posterURL = ImageURLBuilder.smallScaled.getImageURL(imagePath: movie.posterPath)
        title = movie.title
        releaseDate = movie.releaseDate.toString()
        overview = movie.overview
    }
}

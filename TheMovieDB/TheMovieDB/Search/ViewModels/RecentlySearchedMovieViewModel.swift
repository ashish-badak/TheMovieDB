//
//  RecentlySearchedMovieViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class RecentlySearchedMovieViewModel: RowViewModel {
    let posterURL: String?
    let title: String
    
    init(movie: Movie) {
        title = movie.title
        posterURL = PosterImageURLBuilder(scale: .small).getImageURL(imagePath: movie.posterPath)
    }
}

//
//  SimilarMovieViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class SimilarMovieViewModel: RowViewModel {
    let posterURL: String?
    var didSelect: (() -> Void)?
    
    init(movie: Movie) {
        posterURL = PosterImageURLBuilder(scale: .small).getImageURL(imagePath: movie.posterPath)
    }
}

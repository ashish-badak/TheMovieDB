//
//  MovieCardViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol MovieCardViewModelDataSource: AnyObject {
    var posterURL: String? { get }
    var title: String { get }
    var releaseDate: String { get }
    var overview: String? { get }
    var bookButtonTitle: String { get }
}

extension MovieCardViewModelDataSource {
    var bookButtonTitle: String { "Book" }
}

protocol MovieCardViewModelDelegate: AnyObject {
    var bookButtonActionHandler: (() -> Void)? { get set }
}

typealias MovieCardViewModeling = MovieCardViewModelDataSource & MovieCardViewModelDelegate

final class MovieCardViewModel: MovieCardViewModeling {
    let posterURL: String?
    let title: String
    let releaseDate: String
    let overview: String?
    
    var bookButtonActionHandler: (() -> Void)?
    
    init(movie: Movie) {
        posterURL = ImageURLBuilder.smallScaled.getImageURL(imagePath: movie.posterPath)
        title = movie.title
        releaseDate = movie.releaseDate.toString()
        overview = movie.overview
    }
}

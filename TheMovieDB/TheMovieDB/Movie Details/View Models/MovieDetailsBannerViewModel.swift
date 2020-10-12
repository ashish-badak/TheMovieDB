//
//  MovieDetailsBannerViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol MovieDetailsBannerViewModelDataSource {
    var bannerURL: String? { get }
    var posterURL: String? { get }
    var title: String { get }
    var releaseDate: String { get }
    var genres: String? { get }
}

final class MovieDetailsBannerViewModel: MovieDetailsBannerViewModelDataSource, RowViewModel {
    var bannerURL: String?
    var posterURL: String?
    var title: String
    var releaseDate: String
    var genres: String?
    
    init(movie: Movie) {
        bannerURL = BannerImageURLBuilder(scale: .deviceScaled).getImageURL(imagePath: movie.backdropPath)
        posterURL = PosterImageURLBuilder(scale: .small).getImageURL(imagePath: movie.posterPath)
        title = movie.title
        releaseDate = movie.releaseDate.toString()
        
        genres = movie.genres?
            .compactMap { $0.name }
            .filter { !$0.isEmpty }
            .joined(separator: ", ")
    }
}

final class MovieDetailsSectionViewModel: SectionViewModel {
    var rowViewModels: [RowViewModel]
    
    init(movie: Movie) {
        let movieViewModel = MovieDetailsBannerViewModel(movie: movie)
        rowViewModels = [movieViewModel]
    }
    
    func getRowViewModels() -> [RowViewModel] {
        rowViewModels
    }
}

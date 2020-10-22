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
    var didSelect: (() -> Void)?
    
    init(movie: Movie) {
        title = movie.title
        posterURL = PosterImageURLBuilder(scale: .small).getImageURL(imagePath: movie.posterPath)
    }
}

final class RecentlySearchedSectionViewModel: SectionViewModel {
    var rowViewModels: [RecentlySearchedMovieViewModel]
    let sectionHeaderViewModel: HeadingViewModel
    var didSelectMovie: ((Movie) -> Void)?
    
    init(movies: [Movie]) {
        sectionHeaderViewModel = HeadingViewModel(heading: "Recently Searched")
        
        rowViewModels = []
        for movie in movies {
            let viewModel = RecentlySearchedMovieViewModel(movie: movie)
            viewModel.didSelect = { [weak self] in
                self?.didSelectMovie?(movie)
            }
            rowViewModels.append(viewModel)
        }
    }
    
    func getRowViewModels() -> [RowViewModel] {
        rowViewModels
    }
    
    func getSectionHeaderViewModel() -> RowViewModel? {
        sectionHeaderViewModel
    }
}

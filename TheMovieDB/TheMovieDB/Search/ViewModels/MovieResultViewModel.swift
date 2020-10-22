//
//  MovieResultViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 22/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class MovieResultViewModel: RowViewModel {
    let title: String
    var didSelect: (() -> Void)?

    init(movie: Movie) {
        title = movie.title
    }
}

final class MovieResultSectionViewModel: SectionViewModel {
    var rowViewModels: [MovieResultViewModel]
    var didSelectMovie: ((Movie) -> Void)?
    
    init(movies: [Movie]) {
        rowViewModels = []
        for movie in movies {
            let viewModel = MovieResultViewModel(movie: movie)
            viewModel.didSelect = { [weak self] in
                self?.didSelectMovie?(movie)
            }
            rowViewModels.append(viewModel)
        }
    }
    
    func getRowViewModels() -> [RowViewModel] {
        rowViewModels
    }
}

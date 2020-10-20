//
//  SimilarMoviesSectionViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class SimilarMoviesSectionViewModel: SectionViewModel {
    private var rowViewModels: [RowViewModel] = []
    private var sectionHeaderViewModel: RowViewModel
    var didSelectMovie: ((Movie) -> Void)?
    
    init(movies: [Movie]) {
        sectionHeaderViewModel = HeadingViewModel(heading: "Similar Movies")
        
        for movie in movies {
            let viewModel = SimilarMovieViewModel(movie: movie)
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

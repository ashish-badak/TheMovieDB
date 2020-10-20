//
//  SimilarMoviesSectionViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class SimilarMoviesSectionViewModel: SectionViewModel {
    private var rowViewModels: [RowViewModel]
    private var sectionHeaderViewModel: RowViewModel
    
    init(movies: [Movie]) {
        rowViewModels = movies.map { SimilarMovieViewModel(movie: $0) }
        sectionHeaderViewModel = HeadingViewModel(heading: "Similar Movies")
    }
    
    func getRowViewModels() -> [RowViewModel] {
        rowViewModels
    }
    
    func getSectionHeaderViewModel() -> RowViewModel? {
        sectionHeaderViewModel
    }
}

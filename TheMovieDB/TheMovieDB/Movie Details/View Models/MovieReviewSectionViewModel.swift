//
//  MovieReviewSectionViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class MovieReviewSectionViewModel: SectionViewModel {
    private var rowViewModels: [MovieReviewViewModel]
    private var sectionHeaderViewModel: HeadingViewModel
    
    init(reviews: [Review]) {
        rowViewModels = reviews.map { MovieReviewViewModel(review: $0) }
        sectionHeaderViewModel = HeadingViewModel(heading: "Reviews")
    }
    
    func getRowViewModels() -> [RowViewModel] {
        rowViewModels
    }
    
    func getSectionHeaderViewModel() -> RowViewModel? {
        sectionHeaderViewModel
    }
}

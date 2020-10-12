//
//  CreditsSectionViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class CreditsSectionViewModel: SectionViewModel {
    var rowViewModels: [RowViewModel]
    var sectionHeaderViewModel: RowViewModel
    
    init(type: String, persons: [Person]) {
        rowViewModels = persons.map { CastViewModel(person: $0) }
        sectionHeaderViewModel = HeadingViewModel(heading: type)
    }
    
    func getRowViewModels() -> [RowViewModel] {
        rowViewModels
    }
    
    func getSectionHeaderViewModel() -> RowViewModel? {
        sectionHeaderViewModel
    }
}

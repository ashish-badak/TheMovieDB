//
//  ViewModelProtocols.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol RowViewModel {}

protocol SectionViewModel {
    func getRowViewModels() -> [RowViewModel]
    func getSectionHeaderViewModel() -> RowViewModel?
    func getSectionFooterViewModel() -> RowViewModel?
}

extension SectionViewModel {
    func getSectionHeaderViewModel() -> RowViewModel? {
        nil
    }
    func getSectionFooterViewModel() -> RowViewModel? {
        nil
    }
}

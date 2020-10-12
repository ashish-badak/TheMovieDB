//
//  HeadingViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class HeadingViewModel: RowViewModel {
    var heading: String
    
    init(heading: String) {
        self.heading = heading
    }
}

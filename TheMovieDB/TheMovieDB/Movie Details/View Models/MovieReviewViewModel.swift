//
//  MovieReviewViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 20/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

final class MovieReviewViewModel: RowViewModel {
    let author: String
    let reviewDescription: String
    
    init(review: Review) {
        author = review.author
        reviewDescription = review.content
    }
}

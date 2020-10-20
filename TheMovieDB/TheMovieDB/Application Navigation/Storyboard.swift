//
//  Storyboard.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

enum Storyboard: StoryboardProvider {
    case movieListing
    case movieDetails
    
    var storyboardName: String {
        switch self {
        case .movieListing: return "MovieListing"
        case .movieDetails: return "MovieDetails"
        }
    }
}

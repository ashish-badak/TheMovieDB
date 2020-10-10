//
//  Storyboard.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

enum Storyboard: StoryboardProvider {
    case main
    case movieListing
    case movieDetails
    
    var storyboardName: String {
        switch self {
        case .main: return "Main"
        case .movieListing: return "MovieListing"
        case .movieDetails: return "MovieDetails"
        }
    }
}

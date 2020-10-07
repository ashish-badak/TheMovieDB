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
    
    var storyboardName: String {
        switch self {
        case .main: return "Main"
        }
    }
}

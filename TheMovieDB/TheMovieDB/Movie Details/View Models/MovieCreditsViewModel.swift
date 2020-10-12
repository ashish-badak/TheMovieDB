//
//  MovieCreditsViewModel.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol MovieCreditViewModelDataSource {
    var profilePictureURL: String? { get }
    var personName: String { get }
    var personRole: String { get }
}

final class CastViewModel: MovieCreditViewModelDataSource {
    var profilePictureURL: String?
    var personName: String
    var personRole: String
    
    init(person: Person) {
        profilePictureURL = ImageURLBuilder(scale: .custom(width: 80)).getImageURL(imagePath: person.profilePath)
        personName = person.name
        personRole = person.role
    }
}



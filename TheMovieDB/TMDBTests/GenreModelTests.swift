//
//  GenreModelTests.swift
//  TMDBTests
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import XCTest
@testable import TMDB

class GenreModelTests: XCTestCase {
    func testGenreModelCreation() {
        let genreId = 2
        let genreName = "Action"
        let genre = Genre(id: genreId, name: genreName)
        XCTAssertEqual(genre.id, genreId)
        XCTAssertEqual(genre.name, genreName)
    }
}

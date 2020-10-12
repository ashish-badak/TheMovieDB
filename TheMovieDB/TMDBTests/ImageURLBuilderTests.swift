//
//  ImageURLBuilderTests.swift
//  TMDBTests
//
//  Created by Ashish Personal on 12/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import XCTest
@testable import TMDB

class ImageURLBuilderTests: XCTestCase {
    lazy var posterUrlBuilder = PosterImageURLBuilder(scale: .large)
    lazy var bannerUrlBuilder = BannerImageURLBuilder(scale: .deviceScaled)
    lazy var profileUrlBuilder = ProfileImageURLBuilder(scale: .common)
    let path = "samplePath.jpg"
    let baseURL = "https://image.tmdb.org/t/p/"

    override func setUp() {
        super.setUp()
    }
    
    func testPosterImageURLBuilder() {
        testURLBuilder(builder: posterUrlBuilder, scale: ImageScale.Poster.large)
        testURLBuilderForNilPath(builder: posterUrlBuilder)
    }
    
    func testBannerImageURLBuilder() {
        testURLBuilder(builder: bannerUrlBuilder, scale: ImageScale.Banner.deviceScaled)
        testURLBuilderForNilPath(builder: bannerUrlBuilder)
    }
    
    func testProfileImageURLBuilder() {
        testURLBuilder(builder: profileUrlBuilder, scale: ImageScale.Profile.common)
        testURLBuilderForNilPath(builder: profileUrlBuilder)
    }
    
    func testURLBuilder(builder: ImageURLBuilder, scale: ImageScaler) {
        let url = builder.getImageURL(imagePath: path)
        
        if let value = url {
            XCTAssertEqual(value, "\(baseURL)\(scale.size)/\(path)")
        } else {
            XCTFail("URL should not be nil if path is given")
        }
    }
    
    func testURLBuilderForNilPath(builder: ImageURLBuilder) {
        let nilURL = builder.getImageURL(imagePath: "")
        XCTAssertNil(nilURL, "URL should be nil when image path is empty")
    }
}

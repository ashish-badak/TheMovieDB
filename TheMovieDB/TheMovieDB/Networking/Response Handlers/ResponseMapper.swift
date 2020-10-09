//
//  ResponseMapper.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol ResponseMapper {
    associatedtype MappingType
    associatedtype InputType
    func decode(_ data: InputType) -> Result<MappingType, Error>
}

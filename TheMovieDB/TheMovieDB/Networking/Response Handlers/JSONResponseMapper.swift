//
//  JSONResponseMapper.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

struct JSONResponseMapper<MappingType: Decodable>: ResponseMapper {
    typealias InputType = Data
    let decoder: JSONDecoder
    
    func decode(_ data: InputType) -> Result<MappingType, Error> {
        do {
            let mappedData = try decoder.decode(MappingType.self, from: data)
            return .success(mappedData)
        } catch {
            return .failure(APIRequestError.decodingFailure)
        }
    }
}

extension JSONResponseMapper {
    init() {
        self.init(decoder: .default)
    }
}

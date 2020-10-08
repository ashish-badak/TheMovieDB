//
//  ParameterEncoding.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 08/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

enum ParameterEncoding {
    case urlEncoding
    case jsonEncoding
    case urlAndJsonEncoding
    
    func encode(
        urlRequest: inout URLRequest,
        bodyParameters: Parameters?,
        urlParameters: Parameters?
    ) throws {
        
        do {
            switch self {
            case .urlEncoding:
                if let urlParameters = urlParameters {
                    try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
                }
                
            case .jsonEncoding:
                if let bodyParameters = bodyParameters {
                    try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
                }
                
            case .urlAndJsonEncoding:
                if let urlParameters = urlParameters {
                    try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
                }
                if let bodyParameters = bodyParameters {
                    try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
                }
            }
            
        } catch {
            throw error
        }
    }
}

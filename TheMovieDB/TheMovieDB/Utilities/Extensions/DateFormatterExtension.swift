//
//  DateFormatterExtension.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let serverDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    enum TMDB {
        static var serverDateFormat: String { "yyyy-MM-dd" }
        static var displayDateFormat: String { "dd MMM, yyyy" }
    }
}

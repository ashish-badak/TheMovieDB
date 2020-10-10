//
//  DateFormatterExtension.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 09/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let serverDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.TMDB.serverDateFormat
        return formatter
    }()
    
    enum TMDB {
        static var serverDateFormat: String { "yyyy-MM-dd" }
        static var displayDateFormat: String { "dd MMM, yyyy" }
    }
}

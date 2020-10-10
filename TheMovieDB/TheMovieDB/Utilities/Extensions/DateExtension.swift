//
//  DateExtension.swift
//  TheMovieDB
//
//  Created by Ashish Badak on 10/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import Foundation

extension Date {
    func toString(
        format: String = DateFormatter.TMDB.displayDateFormat,
        timezone: TimeZone = TimeZone.current
    ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = timezone
        return dateFormatter.string(from: self)
    }
}

//
//  DateFormatter.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 17.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func appLocale() -> Locale {
        return Locale(identifier: "en_GB")
    }
    
    func appTimeZone() -> TimeZone? {
        return TimeZone(abbreviation: "UTC")
    }
    
    func dateFromGraphQLString(dateString: String) -> Date? {
        self.dateFormat = "yyyy-mm-dd"
        self.timeZone = appTimeZone()
        self.locale = appLocale()
        return self.date(from: dateString)
    }

    func dayWidgetDateAsString(date: Date) -> String? {
        self.dateFormat = "MMMM, dd"
        self.timeZone = appTimeZone()
        self.locale = appLocale()
        return self.string(from: date)
    }

}

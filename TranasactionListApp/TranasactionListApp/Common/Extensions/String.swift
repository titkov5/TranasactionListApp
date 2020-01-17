//
//  String.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 17.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

extension String {
    
    func dayWidgetFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        if let date = dateFormatter.dateFromGraphQLString(dateString: self) {
            return dateFormatter.dayWidgetDateAsString(date: date) ?? "#error_date"
        } else {
            return "#error_date"
        }
    }

}

//
//  DailyAmount.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 17.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

extension DailyAmount {
    
    func amountAsString() -> String {
        switch currencyCode {
        case .gbp:
            if value.hasPrefix("-") {
                return "-" + "£" + value.dropFirst()
            } else {
                return "£" + value
            }
        case .rub:
            return value + " ₽"
            
        case .usd:
            return value + " $"
            
        default:
            return value
        }
    }
}

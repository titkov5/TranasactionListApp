//
//  DaySectionWidgetViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 17.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

class DaySectionWidgetViewModel {
    
    private(set) var model: DaySectionWidget?
    private(set) var shouldShowTopSeparator: Bool
    
    init(model: DaySectionWidget?, shouldShowTopSeparator: Bool) {
        self.model = model
        self.shouldShowTopSeparator = shouldShowTopSeparator
    }
    
    var dayDateString : String {
        return model?.date.dayWidgetFormattedDate() ?? " - "
    }
    
    var dayAmountString: String {
        return model?.amount.amountAsString() ?? " - "
    }
    
}

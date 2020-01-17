//
//  TransactionWidgetRowViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 17.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

class TransactionWidgetRowViewModel {
    
    private(set) var model: TransactionWidget?
    
    init(model: TransactionWidget?) {
        self.model = model
    }
    
    var transactionTitle: String {
        return model?.transaction.title ?? "-"
    }
    
    var transactionAmount: String {
        return model?.transaction.amount.amountAsString() ?? " - "
    }
    
    var transactionImageName: String {
        
        if model?.transaction.type == .cashback {
            return "cashback"
        } else if let iconName = model?.image?.iconName {
            if iconName ==  "coffee" {
                return "coffee"
            } else if iconName == "restaurant" {
                return "restaurant"
            }
        }
        
        return "empty"
    }
    
}

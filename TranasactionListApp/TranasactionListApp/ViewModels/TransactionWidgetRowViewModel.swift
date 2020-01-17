//
//  TransactionWidgetRowViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 17.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

class TransactionWidgetRowViewModel {
    
    var model: TransactionWidget?
    
    init(model: TransactionWidget?) {
        self.model = model
    }
    
    func transactionTitle() -> String {
        return model?.transaction.title ?? "-"
    }
    
    func transactionAmount() -> String {
        return model?.transaction.amount.amountAsString() ?? " - "
    }
    
    func transactionImageName() -> String {
        
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

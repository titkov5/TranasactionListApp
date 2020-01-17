//
//  TransactionViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation
import SwiftUI

struct DailyTransactionsFeedViewModel: Identifiable, Equatable {
    let model: DailyTransactionsFeed
    let itemType: TransactionFeedItemType
    private(set) var id: Int
    
    init(model: DailyTransactionsFeed, type: TransactionFeedItemType, id: Int) {
        self.itemType = type
        self.model = model
        self.id = id
    }
    
    func generatedView() -> some View {
        switch itemType {
        case .TransactionWidget:
            let transactionWidget = model.asTransactionWidget
            let transactionWidgetRowViewModel = TransactionWidgetRowViewModel(model: transactionWidget)
            if transactionWidget?.transaction.type == .regular {
                return AnyView(TransactionWidgetRow(viewModel: transactionWidgetRowViewModel))
            } else {
                return AnyView(CashBackTransactionRow(viewModel: transactionWidgetRowViewModel))
            }
        case .DaySectionWidget:
            let dayWidgetViewModel = DaySectionWidgetViewModel(model: model.asDaySectionWidget, shouldShowTopSeparator: self.id != 0 )
            return AnyView(DaySectionWidgetView(viewModel: dayWidgetViewModel))
        }
    }
    
    static func == (lhs: DailyTransactionsFeedViewModel, rhs: DailyTransactionsFeedViewModel) -> Bool {
        return lhs.id == lhs.id
    }
}

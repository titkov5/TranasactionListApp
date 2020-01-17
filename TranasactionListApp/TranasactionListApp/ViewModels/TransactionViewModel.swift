//
//  TransactionViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation
import SwiftUI

typealias DailyTransactionsFeed = TranasactionListApp.TransactionsFeedQuery.Data.DailyTransactionsFeed
typealias DaySectionWidget = DailyTransactionsFeed.AsDaySectionWidget
typealias TransactionWidget = DailyTransactionsFeed.AsTransactionWidget
typealias DailyAmount = TransactionsFeedQuery.Data.DailyTransactionsFeed.AsDaySectionWidget.Amount
typealias Transaction = TransactionsFeedQuery.Data.DailyTransactionsFeed.AsTransactionWidget.Transaction
typealias TransactionAmount  = TransactionsFeedQuery.Data.DailyTransactionsFeed.AsTransactionWidget.Transaction.Amount
enum TransactionFeedItemType: String {
    case TransactionWidget
    case DaySectionWidget
}

struct TransactionViewModel: Identifiable, Equatable {
    let model: DailyTransactionsFeed
    let itemType: TransactionFeedItemType
    private(set) var id: Int
    
    init(model: DailyTransactionsFeed, type: TransactionFeedItemType) {
        self.itemType = type
        self.model = model
        self.id = type.rawValue.hashValue
    }
    
    func generatedView() ->some View {
        var color = Color.white
        switch itemType {
            //TODO unwrapp
        case .TransactionWidget:
            return AnyView(TransactionWidgetRow(model: model.asTransactionWidget!).body)
        case .DaySectionWidget:
          return AnyView( DaySectionWidgetView(model: model.asDaySectionWidget!))
        }
      }
    
    static func == (lhs: TransactionViewModel, rhs: TransactionViewModel) -> Bool {
        return lhs.id == lhs.id
    }
}

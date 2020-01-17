//
//  GraphQLModels.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 17.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

//Typealias for models
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

//
//  TransactionsListViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

final class TransactionsListViewModel: ObservableObject {
    
    @Published var dailyTransactionsFeed: [DailyTransactionsFeedViewModel] = []
    
    init() {
        self.loadDailyFeed()
    }
    
    private func loadDailyFeed() {
        GraphAPI.shared.apollo.fetch(query: TransactionsFeedQuery()) { [weak self] result in
            switch result {
                case .success(let graphQLResult):
                    if let feedItems = graphQLResult.data?.dailyTransactionsFeed?.compactMap({ $0 }) {
                        self?.merge(feedItems)
                    }
                    
                case .failure(let error):
                    print("Failure! Error: \(error)")
                }
        }
    }
    
    private func merge(_ feedItems: [DailyTransactionsFeed]) {
        var newFeed: [DailyTransactionsFeedViewModel] = []
        var index = 0
        for item in feedItems {
            if let feedItemType = TransactionFeedItemType(rawValue: item.__typename) {
                let transactionViewModel = DailyTransactionsFeedViewModel(model: item, type: feedItemType, id: index)
                newFeed.append(transactionViewModel)
                index += 1
            }
        }
        self.dailyTransactionsFeed = newFeed
    }
    
}

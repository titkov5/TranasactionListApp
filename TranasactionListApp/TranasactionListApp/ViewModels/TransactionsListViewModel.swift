//
//  TransactionsListViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation

final class TransactionsListViewModel: ObservableObject {
    
    @Published var transactions: [TransactionViewModel] = []
    
    init() {
        self.loadTransactions()
    }
    
    private func loadTransactions() {
        GraphAPI.shared.apollo.fetch(query: TransactionsFeedQuery()) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                if let feedItems = graphQLResult.data?.dailyTransactionsFeed?.compactMap({ $0 }) {
                   self?.mergeTransactionModels(feedItems)
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    private func mergeTransactionModels(_ feedItems: [DailyTransactionsFeed]) {
        var newTransactions: [TransactionViewModel] = []
        for item in feedItems {
            if let feedItemType = TransactionFeedItemType(rawValue: item.__typename) {
                let transactionViewModel = TransactionViewModel(model: item, type: feedItemType)
                newTransactions.append(transactionViewModel)
            }
        }
        self.transactions = newTransactions
    }
}


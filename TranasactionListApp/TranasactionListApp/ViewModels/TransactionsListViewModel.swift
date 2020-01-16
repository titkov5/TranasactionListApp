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
                //[TranasactionListApp.TransactionsFeedQuery.Data.DailyTransactionsFeed]
                if let transactionsFeed = graphQLResult.data?.dailyTransactionsFeed?.compactMap({ $0?.__typename }) {
                  //  print("Success! Result: ", transactionsFeed)
                    self?.mergeTransactionModels(transactionsFeed)
                }
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    private func mergeTransactionModels(_ transactionsFeed: [String]) {
        var newTransactions: [TransactionViewModel] = []
        for type in transactionsFeed {
            let transactionViewModel = TransactionViewModel(type: type)
            newTransactions.append(transactionViewModel)
        }
        self.transactions = newTransactions
    }
}


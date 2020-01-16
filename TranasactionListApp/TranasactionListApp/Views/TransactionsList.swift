//
//  TransactionsList.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import SwiftUI

struct TransactionsList: View {
    
    @EnvironmentObject var viewModel: TransactionsListViewModel

    var body: some View {
        ScrollView {
            ForEach(viewModel.transactions) { transactionViewModel in
                Text(transactionViewModel.type)
            }
        }
    }
}

struct TransactionsList_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsList()
    }
}

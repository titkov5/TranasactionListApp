//
//  CashBackTransactionRow.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import SwiftUI

struct CashBackTransactionRow: View {
    
    var viewModel: TransactionWidgetRowViewModel
    
    var body: some View {
            HStack {
                Spacer()
                    .frame(width: 15.0)
                HStack {
                    Spacer()
                        .frame(width: 15.0)
                    Image(viewModel.transactionImageName())
                        .frame(width: 47, height: 47, alignment: .center)
                        .cornerRadius(20)
                    Spacer()
                        .frame(width: 15.0)
                        .frame(width: 15)
                    Text(viewModel.transactionTitle())
                        .foregroundColor(cashBackTitleGreen)
                    Spacer()
                    Text(viewModel.transactionAmount())
                        .foregroundColor(cashBackTitleGreen)
                        .padding(10)
                }
                .frame(height: 72)
                .background(mainGreen)
                .cornerRadius(16)
                Spacer()
                    .frame(width: 15.0)
            }
            .frame(height: 72)
        }
}

struct CashBackTransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        let model = TransactionWidget(transaction: Transaction(id: "1", title: "Hard Rock Cafe", amount: TransactionAmount(value: "-100", currencyCode: .gbp), type: .cashback))
        let viewModel = TransactionWidgetRowViewModel(model: model )
        return CashBackTransactionRow(viewModel: viewModel)
    }
}



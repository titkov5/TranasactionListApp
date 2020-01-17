//
//  CashBackTransactionRow.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import SwiftUI

struct CashBackTransactionRow: View {
    
    var model: TransactionWidget
    
    var body: some View {
            HStack {
                HStack {
                    Image("cashback")
                        .resizable()
                        .frame(width: 27, height: 27, alignment: .center)
                        .cornerRadius(20)
                    
                    Spacer()
                    Text(model.transaction.title)
                    Spacer()
                    Text(model.transaction.amount.value)
                        .padding(10)
                }
                .padding(.leading, 20)
                .cornerRadius(10, antialiased: true)
                .background(Color(red: 241/255, green: 249/255, blue: 232/255))
            }
            .frame(height: 72)
            
    }
}

struct CashBackTransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        CashBackTransactionRow(model: TransactionWidget(transaction: Transaction(id: "1", title: "Hard Rock Cafe", amount: TransactionAmount(value: "-100", currencyCode: .gbp), type: .cashback)))
    }
}

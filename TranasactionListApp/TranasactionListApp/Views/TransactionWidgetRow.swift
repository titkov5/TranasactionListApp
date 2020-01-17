//
//  TransactionWidgetRow.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import SwiftUI

struct TransactionWidgetRow: View {
    var model: TransactionWidget
    
    var body: some View {
        HStack {
            Spacer()
            Image("coffee")
                .resizable()
                .frame(width: 47, height: 47, alignment: .center)
                .cornerRadius(20)
            Spacer()
            Text(model.transaction.title)
            Spacer()
            Text(model.transaction.amount.value)
        }
        .frame(height: 72)
    }
}

struct TransactionWidgetRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionWidgetRow(model: TransactionWidget(transaction: Transaction(id: "1", title: "Nando's", amount: TransactionAmount(value: "-10", currencyCode: .gbp), type: .regular)))
    }
}

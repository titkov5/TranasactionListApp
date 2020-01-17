//
//  TransactionWidgetRow.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import SwiftUI

struct TransactionWidgetRow: View {
    
    var viewModel: TransactionWidgetRowViewModel
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 30)
            Image(viewModel.transactionImageName)
                .frame(width: 47, height: 47, alignment: .center)
                .background(imageGray)
                .cornerRadius(20)
            Spacer()
                .frame(width: 15)
            Text(viewModel.transactionTitle)
                .fontWeight(.light)
            Spacer()
            Text(viewModel.transactionAmount)
                .fontWeight(.light)
            Spacer()
                .frame(width: 30)
        }
        .frame(height: 72)
    }
}

struct TransactionWidgetRow_Previews: PreviewProvider {
   
    static var previews: some View {
        let model = TransactionWidget(transaction: Transaction(id: "1", title: "Nando's", amount: TransactionAmount(value: "-10", currencyCode: .gbp), type: .regular))
        let viewModel = TransactionWidgetRowViewModel(model: model )
        return  TransactionWidgetRow(viewModel: viewModel)
    }
}

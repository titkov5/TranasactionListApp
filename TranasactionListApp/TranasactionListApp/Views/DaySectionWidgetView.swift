//
//  DaySectionWidgetView.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import SwiftUI

struct DaySectionWidgetView: View {
    var viewModel: DaySectionWidgetViewModel
    
    var body: some View {
        VStack {
            if viewModel.shouldShowTopSeparator {
                Rectangle()
                    .fill(mainGray)
                    .frame(height: 7)
                    .edgesIgnoringSafeArea(.horizontal)
            }
            
            HStack {
                Spacer()
                    .frame(width: 30)
                Text(viewModel.dayDateString)
                    .foregroundColor(dateGray)
                Spacer()
                Text(viewModel.dayAmountString)
                    .foregroundColor(.black)
                    .fontWeight(.regular)
                Spacer()
                    .frame(width: 30)
            }
            .frame(height: 60)
        }
    }
}

struct DaySectionWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        let model = DaySectionWidget(date: "2019-11-18".dayWidgetFormattedDate(), amount: DailyAmount(value: "-48.00", currencyCode: .rub))
        let viewModel = DaySectionWidgetViewModel(model: model, shouldShowTopSeparator: false)
        return DaySectionWidgetView(viewModel: viewModel)
    }
}

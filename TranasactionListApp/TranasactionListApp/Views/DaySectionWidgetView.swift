//
//  DaySectionWidgetView.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import SwiftUI

struct DaySectionWidgetView: View {
    var model: DaySectionWidget
    var body: some View {
        HStack {
            Text(model.date)
            Spacer()
            Text(model.amount.value)
        }.frame(height: 60)
    }
}

struct DaySectionWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        DaySectionWidgetView(model: DaySectionWidget(date: "21.01.2019", amount: DailyAmount(value: "-10", currencyCode: .gbp)))
    }
}

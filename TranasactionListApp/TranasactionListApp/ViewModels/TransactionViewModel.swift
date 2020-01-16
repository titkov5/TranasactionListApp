//
//  TransactionViewModel.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 16.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation
import SwiftUI

struct TransactionViewModel: Identifiable {
    let type: String
    private(set) var id: Int
    
    init(type: String = "") {
        self.type = type
        self.id = type.hashValue
    }
    
    func view() -> some View {
       return Text(self.type)
    }
}

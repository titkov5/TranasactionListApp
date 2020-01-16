//
//  GraphAPI.swift
//  TranasactionListApp
//
//  Created by Ivan Titkov on 15.01.2020.
//  Copyright © 2020 noteam. All rights reserved.
//

import Foundation
import Apollo

class GraphAPI {
  static let shared = GraphAPI()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)

}

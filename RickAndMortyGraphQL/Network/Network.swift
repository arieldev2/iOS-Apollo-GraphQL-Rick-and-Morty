//
//  Network.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/14/23.
//

import Foundation
import Apollo

class Network {
    
  static let shared = Network()

  private init() {}

  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}

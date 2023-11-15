//
//  RMInfo.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/14/23.
//

import Foundation
import RickAndMortyAPI

struct RMInfo{
    let prev: Int?
    let next: Int?
    
    init(_ info: CharacterListQuery.Data.Characters.Info?){
        self.prev = info?.prev
        self.next = info?.next
    }
}

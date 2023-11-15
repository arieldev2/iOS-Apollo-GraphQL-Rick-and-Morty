//
//  Character.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/14/23.
//

import Foundation
import RickAndMortyAPI

struct RMCharacter: Identifiable{
    let id: String
    let name: String
    let image: String
    let origin: RMOrigin
    
    init(_ character: CharacterListQuery.Data.Characters.Result?){
        self.id = character?.id ?? ""
        self.name = character?.name ?? ""
        self.image = character?.image ?? ""
        self.origin = RMOrigin(name: character?.origin?.name ?? "Unknown")
    }
}




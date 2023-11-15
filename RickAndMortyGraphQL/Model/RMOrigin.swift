//
//  RMOrigin.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/14/23.
//

import Foundation

struct RMOrigin{
    let name: String
    
    init(name: String?) {
        self.name = name ?? "Unknown"
    }
}

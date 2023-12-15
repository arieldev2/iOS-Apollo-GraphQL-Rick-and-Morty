//
//  MockNetwork.swift
//  RickAndMortyGraphQLTests
//
//  Created by Ariel Ortiz on 11/21/23.
//

import Foundation
@testable import RickAndMortyGraphQL
import RickAndMortyAPI
import Apollo
import ApolloTestSupport
import RickAndMortyTestMocks

let mock = Mock<Query>(
    characters: Mock<Characters>(
        info: Mock<Info>(
            next: 2,
            prev: nil
            
        ),
        results: [
            Mock<Character>(
                id: "1",
                image: "image.jpg",
                name: "test 1",
                origin: Mock<Location>(name: "locationtest")
                
                
            ),
            Mock<Character>(
                id: "2",
                image: "image2.jpg",
                name: "test 2",
                origin: Mock<Location>(name: "locationtest2")
                
                
            )

        ]
    )
)


class MockNetwork: NetworkProtocol{
    func getCharacters(page: GraphQLNullable<Int>, completion: @escaping (Result<CharacterListQuery.Data?, ErrorNetwork>) -> Void) {
        
        let data = CharacterListQuery.Data.from(mock)
        completion(.success(data))
        
    }
    
    
}

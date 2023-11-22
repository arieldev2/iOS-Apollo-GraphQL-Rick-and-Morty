//
//  RickAndMortyGraphQLTests.swift
//  RickAndMortyGraphQLTests
//
//  Created by Ariel Ortiz on 11/21/23.
//

import XCTest
@testable import RickAndMortyGraphQL

final class RickAndMortyGraphQLTests: XCTestCase {
    
    var vm: RMViewModel!

    @MainActor override func setUpWithError() throws {
        let mockNetwork = MockNetwork()
        vm = RMViewModel(service: mockNetwork)
    }

    override func tearDownWithError() throws {
        vm = nil
    }


    @MainActor func test_getCharacters_shouldBeTwo(){
        vm.fetchCharacters()
        XCTAssertEqual(vm.characters.count, 2)
        
    }
    
    @MainActor func test_getCharacters_prevShouldBeNil(){
        vm.fetchCharacters()
        XCTAssertNil(vm.pageInfo?.prev)

    }
    
    @MainActor func test_getCharacters_nextShouldBeTwo(){
        vm.fetchCharacters()
        XCTAssertEqual(vm.pageInfo?.next, 2)

    }

}

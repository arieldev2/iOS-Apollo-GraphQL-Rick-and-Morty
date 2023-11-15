//
//  RMViewModel.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/14/23.
//

import Foundation
import Apollo
import RickAndMortyAPI

@MainActor
final class RMViewModel: ObservableObject {
    
    @Published var characters: [RMCharacter] = []
    @Published var isLoading: Bool = false
    @Published private var page: GraphQLNullable<Int> = 1
    @Published private var pageInfo: RMInfo? = nil
    
    func fetchCharacters(paginate: Bool = false, refresh: Bool = false) {
        
        isLoading = true
        
        if paginate{
            if !checkPagination(){
                isLoading = false
                return
            }
        }
        
        if refresh{
            self.characters.removeAll()
            self.page = 1
        }
        
        Network.shared.apollo.fetch(query: CharacterListQuery(page: page)) { [weak self] result in
            switch result {
            case .success(let result):
                self?.processdata(data: result.data)
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    
    private func processdata(data: CharacterListQuery.Data?){
        guard let data = data?.characters else{
            return
        }
        guard let characters = data.results else {
            return
        }
        self.pageInfo = RMInfo(data.info)
        self.characters.append(contentsOf: characters.map({RMCharacter($0)}))
        isLoading = false
        
    }
    
    private func checkPagination() -> Bool {
        if let pageIn = self.pageInfo{
            if let next = pageIn.next{
                self.page = GraphQLNullable<Int>(integerLiteral: next)
                return true
            }else{
                return false
            }
        }else{
            return false
        }
        
    }
}

//
//  Network.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/14/23.
//

import Foundation
import Apollo
import RickAndMortyAPI

enum ErrorNetwork: Error{
    case badUrl
    case badDecoding
    case badResponse
    case serverError(msg: String)
    
    var message: String{
        switch self {
        case .badUrl:
            return "Bad url"
        case .badDecoding:
            return "Bad decoding"
        case .badResponse:
            return "Bad response"
        case .serverError(let msg):
            return msg
        }
    }
}

protocol NetworkDelegate{
    func getCharacters(page: GraphQLNullable<Int>, completion: @escaping (Result<CharacterListQuery.Data?, ErrorNetwork>) -> Void)
}

class Network: NetworkDelegate{
    
    static let shared = Network()
    
    private init() {}
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    
    func getCharacters(page: GraphQLNullable<Int>, completion: @escaping (Result<CharacterListQuery.Data?, ErrorNetwork>) -> Void){
        
        apollo.fetch(query: CharacterListQuery(page: page)) { [weak self] result in
            switch result {
            case .success(let result):
                
                if let errors = result.errors{
                    guard let errorRes = self?.processError(error: errors).message else {
                        completion(.failure(.badResponse))
                        return
                    }
                    completion(.failure(.serverError(msg: errorRes)))
                    return
                }
                
                guard let data = result.data else{
                    
                    completion(.failure(.badDecoding))
                    return
                }
                
                completion(.success(data))
                
            case .failure(let error):
                
                print(error)
                completion(.failure(.badResponse))
            }
        }
    }
    
    private func processError(error: [GraphQLError]) -> RMErrorResponse{
        guard let checkMessage = error.first, let message = checkMessage.message  else { return RMErrorResponse(message: "Something went wrong.")}
        return RMErrorResponse(message: message)
    }
}

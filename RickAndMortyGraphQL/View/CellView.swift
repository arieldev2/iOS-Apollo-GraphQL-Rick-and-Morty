//
//  CellView.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/15/23.
//

import SwiftUI

struct CellView: View {
    
    let character: RMCharacter
    
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: URL(string: character.image)) { phase in
                
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 350)
                case .failure( _):
                    HStack(alignment: .center){
                        Image(systemName: "xmark.octagon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.black)
                            .padding()
                            .padding(.top, 20)
                    }
                    .frame(maxWidth: .infinity)
                @unknown default:
                    HStack(alignment: .center){
                        Image(systemName: "xmark.octagon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.black)
                            .padding()
                            .padding(.top, 20)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
                            
            VStack(alignment: .leading){
                Text(character.name)
                    .font(.title)
                Text("Origin: \(character.origin.name)")
                    .font(.subheadline)
            }
            .foregroundStyle(.black)
            .padding()
            
        }
        .background(Color(uiColor: UIColor(red: 219/255, green: 252/255, blue: 255/255, alpha: 1.0)))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
}


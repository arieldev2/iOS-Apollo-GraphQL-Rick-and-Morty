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
            AsyncImageView(url: URL(string: character.image))
                            
            VStack(alignment: .leading){
                Text(character.name)
                    .font(.titleFont)

                Text("Origin: \(character.origin.name)")
                    .font(.subtitleFont)

            }
            .foregroundStyle(.black)
            .padding()
            
        }
        .background(Color(uiColor: UIColor(red: 219/255, green: 252/255, blue: 255/255, alpha: 1.0)))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .padding()
    }
}


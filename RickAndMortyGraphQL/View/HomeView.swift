//
//  ContentView.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 11/14/23.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm = RMViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: FontTypes.RobotoMonoBold.rawValue, size: 35)!]
        UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: FontTypes.RobotoMonoBold.rawValue, size: 20)!]
        
     }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(vm.characters){ item in
                        CellView(character: item)
                        .onAppear{
                            if item.id == vm.characters.last?.id{
                                vm.fetchCharacters(paginate: true)
                            }
                        }
                    }
                    if vm.isLoading{
                        ProgressView()
                    }
                }
            }
            .refreshable {
                vm.fetchCharacters(refresh: true)
            }
            .navigationTitle("Rick and Morty")
        }
        .onAppear{
            vm.fetchCharacters()
        }
    }
}

#Preview {
    HomeView()
}

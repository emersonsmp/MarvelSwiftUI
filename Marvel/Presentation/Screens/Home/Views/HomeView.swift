//
//  HomeView.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = Resolver.shared.resolve(HomeViewModel.self)
    
    var body: some View {
        NavigationStack {
            ZStack {
                BaseStateView(viewModel: viewModel) {
                    content
                        .padding([.leading, .trailing], 15)
                        .navigationTitle("Marvel Heroes".localized())
                        .searchable(text: $viewModel.searchText,
                                    prompt: "Hero Name".localized())
                        .onChange(of: viewModel.debouncedSearchText, perform: { _ in
                            Task {
                                await viewModel.searchCharacters()
                            }
                        })
                }
            }
        }
    }
        
    var content: some View {
        CustomListView(items: viewModel.characters) { item in
            CharacterProfileView(character: item)
        }
        
    itemView: { item in
        CharacterView(character: item)
            .task {
                await viewModel
                    .loadMoreCharactersIfNeeded(currentItem: item)
            }
    }
    }
}

#Preview {
    HomeView()
}

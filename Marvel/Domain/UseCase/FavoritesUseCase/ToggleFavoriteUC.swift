//
//  ToggleFavoriteUC.swift
//  Marvel
//
//  Created by Emerson Sampaio on 19/02/24.
//

import Foundation

protocol ToggleFavoriteUC {
    func execute(character: Character)
}

class DefaultToggleFavoriteUC: ToggleFavoriteUC {
    private let favoritesRepository: FavoritesRepository
    
    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute(character: Character) {
        if favoritesRepository.isFavorite(character: character) {
            favoritesRepository.removeFavorite(character: character)
        } else {
            favoritesRepository.addFavorite(character: character)
        }
    }
}

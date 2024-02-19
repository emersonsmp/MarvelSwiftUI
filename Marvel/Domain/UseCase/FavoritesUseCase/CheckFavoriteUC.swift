//
//  CheckFavoriteUC.swift
//  Marvel
//
//  Created by Emerson Sampaio on 19/02/24.
//

import Foundation

protocol CheckFavoriteUC {
    func execute(character: Character) -> Bool
}

class DefaultCheckFavoriteUC: CheckFavoriteUC {
    private let favoritesRepository: FavoritesRepository
    
    init(favoritesRepository: FavoritesRepository) {
        self.favoritesRepository = favoritesRepository
    }
    
    func execute(character: Character) -> Bool {
        favoritesRepository.isFavorite(character: character)
    }
}

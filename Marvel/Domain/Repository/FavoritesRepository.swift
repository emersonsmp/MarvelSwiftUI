//
//  FavoritesRepository.swift
//  Marvel
//
//  Created by Emerson Sampaio on 19/02/24.
//

import Foundation

protocol FavoritesRepository {
    
    func getFavorites() -> Result<[Character], AppError>
    
    func isFavorite(character: Character) -> Bool
    
    func addFavorite(character: Character)
    
    func removeFavorite(character: Character)
}

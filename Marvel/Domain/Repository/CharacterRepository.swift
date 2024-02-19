//
//  CharacterRepository.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

protocol CharactersRepository {
    func getCharacters(from offset: Int, by searchKey: String?) async -> 
    Result<PaginatedResponse<Character>, AppError>
}

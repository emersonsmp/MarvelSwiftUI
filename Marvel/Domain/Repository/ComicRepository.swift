//
//  ComicRepository.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation

protocol ComicsRepository {
    func getComics(by characterId: Int, from offset: Int) async -> Result<PaginatedResponse<Comic>, AppError>
}

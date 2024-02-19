//
//  GetComicsUseCase.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation

struct GetComicsParams {
    let offset: Int
    let characterID: Int
}

protocol GetComicsUC {
    func execute(with params: GetComicsParams) async -> Result<PaginatedResponse<Comic>, AppError>
}

class DefaultGetComicsUC: GetComicsUC {
    private var repository: ComicsRepository
    
    init(repository: ComicsRepository) {
        self.repository = repository
    }
    
    func execute(with params: GetComicsParams) async -> Result<PaginatedResponse<Comic>, AppError> {
        return await repository.getComics(by: params.characterID, from: params.offset)
    }
}

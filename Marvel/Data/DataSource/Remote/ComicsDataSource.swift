//
//  ComicDataSource.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation

typealias ComicsResponse = BaseResponseModel<PaginatedResponseModel<ComicModel>>

protocol ComicsDataSource {
    func getComics(by characterId: Int, from offset: Int) async throws -> PaginatedResponseModel<ComicModel>
}

class DefaultComicsDataSource: ComicsDataSource {
    private let requestManager: RequestManager
    
    init(requestManager: RequestManager) {
        self.requestManager = requestManager
    }
    
    func getComics(by characterId: Int, from offset: Int) async throws -> PaginatedResponseModel<ComicModel> {
        let request = ComicsRequest.getComicsByCharacterId(characterId: characterId, offset: offset)
        let response: ComicsResponse = try await requestManager.makeRequest(with: request)
        return response.data
    }
}

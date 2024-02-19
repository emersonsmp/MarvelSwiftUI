//
//  HeroProfileViewModel.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation

@MainActor
final class CharacterProfileViewModel: ViewModel {
    private let getComicsUC: GetComicsUC
    private let checkFavoriteUC: CheckFavoriteUC
    private let toggleFavoriteUC: ToggleFavoriteUC
    
    private var currentOffset = 0
    
    @Published var comics: [Comic] = []
    @Published var isFavorite: Bool = false
    
    init(getComicsUC: GetComicsUC,
         checkFavoriteUC: CheckFavoriteUC,
         toggleFavoriteUC: ToggleFavoriteUC) {
        self.getComicsUC = getComicsUC
        self.checkFavoriteUC = checkFavoriteUC
        self.toggleFavoriteUC = toggleFavoriteUC
    }
}

extension CharacterProfileViewModel {
    func loadComics(forCharacter id: Int) async {
        state = .loading
        let result = await getComicsUC.execute(with: GetComicsParams(offset: 0, characterID: id))
        switch result {
        case .success(let data):
            comics.append(contentsOf: data.results ?? [])
            state = .success
        case .failure(let err):
            state = .error(err.localizedDescription)
        }
    }
    
    func checkFavorite(character: Character) {
        let result = checkFavoriteUC.execute(character: character)
        isFavorite = result
    }
    
    func toggleFavorite(character: Character) {
        toggleFavoriteUC.execute(character: character)
        isFavorite.toggle()
    }
}

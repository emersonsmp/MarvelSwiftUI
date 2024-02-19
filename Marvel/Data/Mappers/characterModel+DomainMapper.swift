//
//  characterModel+DomainMapper.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation

extension CharacterModel: DomainMapper {
    func toDomain() -> Character {
        return Character(id: id,
                         name: name,
                         description: characterDescription,
                         modified: modified,
                         thumbnailURL: thumbnail?.url)
    }
}

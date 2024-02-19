//
//  CharacterEntity+Mapper.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation
import CoreData

extension CharacterEntity: DomainMapper {
    typealias EntityType = Character
    
    func toDomain() -> Character {
        return Character(id: Int(id),
                         name: name,
                         description: characterDescription,
                         thumbnailURL: URL(string: thumbnail ?? "")
        )
    }
}

extension Character: CoreDataMapper {
    typealias EntityType = CharacterEntity
    
    func toCoreDataEntity(in context: NSManagedObjectContext) -> CharacterEntity {
        let entity = CharacterEntity(context: context)
        entity.id = Int64(id ?? 0)
        entity.name = name
        entity.characterDescription = description
        entity.thumbnail = thumbnailURL?.absoluteString
        return entity
    }
}

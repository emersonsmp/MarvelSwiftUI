//
//  CharacterModel.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

struct CharacterModel {
    let id: Int?
    let name, characterDescription: String?
    let modified: String?
    let thumbnail: ThumbnailModel?
    
    init(id: Int? = nil,
         name: String? = nil,
         characterDescription: String? = nil,
         modified: String? = nil,
         thumbnail: ThumbnailModel? = nil) {
        self.id = id
        self.name = name
        self.characterDescription = characterDescription
        self.modified = modified
        self.thumbnail = thumbnail
    }
}

extension CharacterModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case characterDescription = "description"
        case modified
        case thumbnail
    }
}

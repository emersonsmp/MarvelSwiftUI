//
//  ComicModel+DomainMapper.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation

extension ComicModel: DomainMapper {
    func toDomain() -> Comic {
        return Comic(
            id: id,
            title: title,
            description: description,
            modified: modified,
            isbn: isbn,
            upc: upc,
            diamondCode: diamondCode,
            ean: ean,
            issn: issn,
            format: format,
            thumbnailURL: thumbnail?.url
        )
    }
}

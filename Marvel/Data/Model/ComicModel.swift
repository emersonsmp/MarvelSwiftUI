//
//  ComicModel.swift
//  Marvel
//
//  Created by Emerson Sampaio on 13/02/24.
//

import Foundation

struct ComicModel: Codable {
    let id: Int?
    let title, description: String?
    let modified: String?
    let isbn, upc, diamondCode, ean: String?
    let issn, format: String?
    let thumbnail: ThumbnailModel?
}

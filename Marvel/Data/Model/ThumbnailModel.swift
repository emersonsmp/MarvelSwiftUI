//
//  ThumbnailModel.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

struct ThumbnailModel {
    let path: String?
    let thumbnailExtension: String?
    
    var url: URL? {
        guard let path, let ext = thumbnailExtension else { return nil }
        return URL(string: "\(path).\(ext)")
    }
    
    init(path: String? = nil,thumbnailExtension: String? = nil) {
        self.path = path
        self.thumbnailExtension = thumbnailExtension
    }
}

extension ThumbnailModel: Codable {
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

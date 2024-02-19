//
//  PaginatedResponseModel.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

struct PaginatedResponseModel<T>: Codable  where T: Codable, T: DomainMapper {
    let offset, limit, total, count: Int?
    let results: [T]?
}

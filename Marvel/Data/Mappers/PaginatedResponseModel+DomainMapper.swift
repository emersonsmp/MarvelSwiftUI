//
//  PaginatedResponseModel+DomainMapper.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

extension PaginatedResponseModel {
    typealias EntityType = PaginatedResponse
    func toDomain<T>(dataType: T.Type) -> PaginatedResponse<T> {
        return PaginatedResponse<T>(offset: offset,
                                    limit: limit,
                                    total: total,
                                    count: count,
                                    results: (results ?? []).compactMap({$0.toDomain() as? T}
                                                                )
        )
    }
}

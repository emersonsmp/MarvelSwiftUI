//
//  DomainMapper.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

protocol DomainMapper {
    associatedtype EntityType
    func toDomain() -> EntityType
}

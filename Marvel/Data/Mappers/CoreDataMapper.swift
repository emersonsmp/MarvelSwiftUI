//
//  CoreDataMapper.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation
import CoreData

protocol CoreDataMapper {
    associatedtype EntityType
    func toCoreDataEntity(in context: NSManagedObjectContext) -> EntityType
}

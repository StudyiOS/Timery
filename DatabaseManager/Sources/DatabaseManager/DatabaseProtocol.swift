//
//  DatabaseProtocol.swift
//
//
//  Created by Leo on 6/3/24.
//

import Foundation
import CoreData
import Entity

//public protocol DatabaseProtocol {
//    func create<T: NSManagedObject>(_ item: T.Type, configure: (T) -> Void) throws
//    func fetch<T: NSManagedObject>(_ item: T.Type, predicate: NSPredicate?) throws -> [T]
//    func update<T: NSManagedObject>(_ item: T) throws
//    func delete<T: NSManagedObject>(_ item: T) throws
//}

public protocol DatabaseProtocol {
    associatedtype Entity: DatabaseEntity
    
    func create(_ entity: Entity) async throws
    func fetch(with id: UUID) async throws -> Entity?
    func fetchAll() async throws -> [Entity]
    func update(_ entity: Entity) async throws
    func delete(_ entity: Entity) async throws
}

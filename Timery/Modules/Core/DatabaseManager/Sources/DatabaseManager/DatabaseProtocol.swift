//
//  DatabaseProtocol.swift
//
//
//  Created by Leo on 6/3/24.
//

import Foundation
import CoreData
import Entity

public protocol DatabaseProtocol {
    associatedtype Entity: DatabaseEntity
    
    func create(_ entity: Entity) async throws
    func fetch(with id: UUID) async throws -> Entity?
    func fetchAll() async throws -> [Entity]
    func update(_ entity: Entity) async throws
    func delete(_ entity: Entity) async throws
}

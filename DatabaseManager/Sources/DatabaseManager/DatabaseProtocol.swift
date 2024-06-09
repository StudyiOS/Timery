//
//  DatabaseProtocol.swift
//
//
//  Created by Leo on 6/3/24.
//

import Foundation
import CoreData

public protocol DatabaseProtocol {
    func create<T: NSManagedObject>(_ item: T.Type, configure: (T) -> Void) throws
    func fetch<T: NSManagedObject>(_ item: T.Type, predicate: NSPredicate?) throws -> [T]
    func update<T: NSManagedObject>(_ item: T) throws
    func delete<T: NSManagedObject>(_ item: T) throws
}

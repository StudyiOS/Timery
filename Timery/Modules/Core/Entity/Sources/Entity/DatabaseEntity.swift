//
//  File.swift
//  
//
//  Created by Leo on 6/10/24.
//

import Foundation
import CoreData

public protocol DatabaseEntity {
    associatedtype EntityDB: NSManagedObject
    var id: UUID { get }
    init(from dbObject: EntityDB)
    @discardableResult
    func toDB(context: NSManagedObjectContext) -> EntityDB
}

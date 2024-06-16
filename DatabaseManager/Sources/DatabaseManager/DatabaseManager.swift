import Foundation
import CoreData
import Entity

public final class DatabaseManager<E: DatabaseEntity>: DatabaseProtocol {
    public typealias Entity = E
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Timery")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    public func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    public func create(_ entity: Entity) async throws {
        try await performDatabaseOperation {
            entity.toDB(context: self.context)
            try self.saveContextIfNeeded()
        }
    }

    public func fetch(with id: UUID) async throws -> Entity? {
        return try await performFetchRequest(with: id) { results in
            return results.map(Entity.init)
        }.first
    }

    public func fetchAll() async throws -> [Entity] {
        return try await performFetchRequest { results in
            return results.map(Entity.init)
        }
    }

    public func update(_ entity: Entity) async throws {
        try await performDatabaseOperation {
            if let object = try self.fetchDatabaseObject(with: entity.id) {
                let mirror = Mirror(reflecting: entity)
                for child in mirror.children {
                    if let key = child.label {
                        object.setValue(child.value, forKey: key)
                    }
                }

                try self.saveContextIfNeeded()
            }
        }
    }

    public func delete(_ entity: Entity) async throws {
        try await performDatabaseOperation {
            if let dbObject = try self.fetchDatabaseObject(with: entity.id) {
                self.context.delete(dbObject)
                try self.saveContextIfNeeded()
            }
        }
    }

    private func saveContextIfNeeded() throws {
        if context.hasChanges {
            try context.save()
        }
    }

    private func performDatabaseOperation(_ operation: @escaping () throws -> Void) async throws {
        try await context.perform {
            try operation()
        }
    }

    private func performFetchRequest(
        with id: UUID? = nil,
        processResults: @escaping ([Entity.EntityDB]) -> [Entity]
    ) async throws -> [Entity] {
        return try await context.perform {
            let request: NSFetchRequest<Entity.EntityDB> = Entity.EntityDB.fetchRequest() as! NSFetchRequest<Entity.EntityDB>
            if let id = id {
                request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            }
            let results = try self.context.fetch(request)
            return processResults(results)
        }
    }

    private func fetchDatabaseObject(with id: UUID) throws -> Entity.EntityDB? {
        let request: NSFetchRequest<Entity.EntityDB> = Entity.EntityDB.fetchRequest() as! NSFetchRequest<Entity.EntityDB>
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        let results = try self.context.fetch(request)
        return results.first
    }
}


//extension DatabaseManager: DatabaseProtocol {
//    
//    
//    public func create<T: NSManagedObject>(_ item: T.Type, configure: (T) -> Void) throws {
//        let entityName = String(describing: T.self)
//        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else {
//            throw NSError(domain: "DatabaseManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "Entity not found"])
//        }
//        let newItem = T(entity: entity, insertInto: context)
//        configure(newItem)
//        try context.save()
//    }
//    
//    public func fetch<T: NSManagedObject>(_ item: T.Type, predicate: NSPredicate? = nil) throws -> [T] {
//        let entityName = String(describing: T.self)
//        let request = NSFetchRequest<T>(entityName: entityName)
//        request.predicate = predicate
//        
//        return try context.fetch(request)
//    }
//    
//    public func update<T: NSManagedObject>(_ item: T) throws {
//        if context.hasChanges {
//            try context.save()
//        }
//    }
//    
//    public func delete<T: NSManagedObject>(_ item: T) throws {
//        context.delete(item)
//        try context.save()
//    }
//}

import Foundation
import CoreData
import Entity

public final class DatabaseManager {
    public static let shared = DatabaseManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Timery") // 여기에 .xcdatamodeld 파일 이름을 입력합니다.
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
}


extension DatabaseProtocol where Self: DatabaseManager {
    
    public func create(_ entity: Entity) async throws {
        try await context.perform {
            _ = entity.toDB(context: self.context)
            try self.saveContextIfNeeded()
        }
    }
    
    public func fetch(with id: UUID) async throws -> Entity? {
        return try await context.perform {
            let request: NSFetchRequest<Entity.EntityDB> = Entity.EntityDB.fetchRequest() as! NSFetchRequest<Entity.EntityDB>
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            let results = try self.context.fetch(request)
            return results.first.map(Entity.init)
        }
    }
    
    public func fetchAll() async throws -> [Entity] {
        return try await context.perform {
            let request: NSFetchRequest<Entity.EntityDB> = Entity.EntityDB.fetchRequest() as! NSFetchRequest<Entity.EntityDB>
            let results = try self.context.fetch(request)
            return results.map(Entity.init)
        }
    }
    
    public func update(_ entity: Entity) async throws {
        try await context.perform {
            let request: NSFetchRequest<Entity.EntityDB> = Entity.EntityDB.fetchRequest() as! NSFetchRequest<Entity.EntityDB>
            request.predicate = NSPredicate(format: "id == %@", entity.id as CVarArg)
            let results = try self.context.fetch(request)
            if let dbObject = results.first {
                entity.toDB(context: self.context)
                try self.saveContextIfNeeded()
            }
        }
    }
    
    public func delete(_ entity: Entity) async throws {
//        try await context.perform {
//            let request: NSFetchRequest<Entity.EntityDB> = Entity.EntityDB.fetchRequest() as! NSFetchRequest<Entity.EntityDB>
//            request.predicate = NSPredicate(format: "id == %@", entity.id as CVarArg)
//            let results = try self.context.fetch(request)
//            if let dbObject = results.first {
//                self.context.delete(dbObject)
//                try self.saveContextIfNeeded()
//            }
//        }
    }
    
    private func saveContextIfNeeded() throws {
        if context.hasChanges {
            try context.save()
        }
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

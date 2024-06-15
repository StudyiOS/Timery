//
//  File.swift
//  
//
//  Created by Leo on 6/10/24.
//

import Foundation
import CoreData
import Entity

public protocol ProjectDatabase {
    func createProject(_ project: ProjectItem) async throws
    func fetchProject(with id: UUID) async throws -> ProjectItem?
    func fetchAllProjects() async throws -> [ProjectItem]
    func updateProject(_ project: ProjectItem) async throws
    func deleteProject(_ project: ProjectItem) async throws
}

extension DatabaseManager: ProjectDatabase {
    
    public func createProject(_ project: ProjectItem) async throws {
        try await context.perform {
            _ = project.toDB(context: self.context)
            try self.saveContextIfNeeded()
        }
    }
    
    public func fetchProject(with id: UUID) async throws -> ProjectItem? {
        return try await context.perform {
            let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            let results = try self.context.fetch(request)
            return results.first.map(ProjectItem.init)
        }
    }
    
    public func fetchAllProjects() async throws -> [ProjectItem] {
        return try await context.perform {
            let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
            let results = try self.context.fetch(request)
            return results.map(ProjectItem.init)
        }
    }
    
    public func updateProject(_ project: ProjectItem) async throws {
        try await context.perform {
            let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", project.id as CVarArg)
            let results = try self.context.fetch(request)
            if let projectDB = results.first {
                projectDB.name = project.name
                projectDB.rcolor = project.rcolor ?? -1
                projectDB.gcolor = project.gcolor ?? -1
                projectDB.bcolor = project.bcolor ?? -1
                projectDB.acolor = project.acolor ?? -1
                try self.saveContextIfNeeded()
            }
        }
    }
    
    public func deleteProject(_ project: ProjectItem) async throws {
        try await context.perform {
            let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", project.id as CVarArg)
            let results = try self.context.fetch(request)
            if let projectDB = results.first {
                self.context.delete(projectDB)
                try self.saveContextIfNeeded()
            }
        }
    }
    
    private func saveContextIfNeeded() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}

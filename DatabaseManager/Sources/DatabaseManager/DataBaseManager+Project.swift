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
    func createProject(_ project: Project) throws
    func fetchProject(with id: UUID) throws -> Project?
    func fetchAllProjects() throws -> [Project]
    func updateProject(_ project: Project) throws
}

extension DatabaseManager: ProjectDatabase {
    
    public func createProject(_ project: Project) throws {
        _ = project.toProjectDB(context: context)
        try saveContextIfNeeded()
    }
    
    public func fetchProject(with id: UUID) throws -> Project? {
        let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        let results = try context.fetch(request)
        return results.first.map(Project.init)
    }
    
    public func fetchAllProjects() throws -> [Project] {
        let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
        let results = try context.fetch(request)
        return results.map(Project.init)
    }
    
    public func updateProject(_ project: Project) throws {
        let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", project.id as CVarArg)
        let results = try context.fetch(request)
        if let projectDB = results.first {
            projectDB.name = project.name
            projectDB.rcolor = project.rcolor
            projectDB.gcolor = project.gcolor
            projectDB.bcolor = project.bcolor
            projectDB.acolor = project.acolor
            try saveContextIfNeeded()
        }
    }
    
    public func deleteProject(_ project: Project) throws {
        let request: NSFetchRequest<ProjectDB> = ProjectDB.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", project.id as CVarArg)
        let results = try context.fetch(request)
        if let projectDB = results.first {
            context.delete(projectDB)
            try saveContextIfNeeded()
        }
    }
    
    private func saveContextIfNeeded() throws {
        if context.hasChanges {
            try context.save()
        }
    }
}

//
//  File.swift
//  
//
//  Created by Leo on 6/10/24.
//

import Foundation
import CoreData
import Entity

public protocol TaskDatabase {
    func createTask(_ task: TaskItem) async throws
    func fetchTask(with id: UUID) async throws -> TaskItem?
    func fetchAllTasks() async throws -> [TaskItem]
    func updateTask(_ task: TaskItem) async throws
}

extension DatabaseManager: TaskDatabase {
    
    public func createTask(_ task: TaskItem) async throws {
        try await context.perform {
            _ = task.toTaskDB(context: self.context)
            try self.saveContextIfNeeded()
        }
    }
    
    public func fetchTask(with id: UUID) async throws -> TaskItem? {
        return try await context.perform {
            let request: NSFetchRequest<TaskDB> = TaskDB.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
            let results = try self.context.fetch(request)
            return results.first.map(TaskItem.init)
        }
    }
    
    public func fetchAllTasks() async throws -> [TaskItem] {
        return try await context.perform {
            let request: NSFetchRequest<TaskDB> = TaskDB.fetchRequest()
            let results = try self.context.fetch(request)
            return results.map(TaskItem.init)
        }
    }
    
    public func updateTask(_ task: TaskItem) async throws {
        try await context.perform {
            let request: NSFetchRequest<TaskDB> = TaskDB.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
            let results = try self.context.fetch(request)
            if let taskDB = results.first {
                taskDB.id = task.id
                taskDB.name = task.name
                taskDB.projectId = task.projectId
                taskDB.desc = task.desc
                taskDB.startTime = task.startTime
                taskDB.endTime = task.endTime
                taskDB.lastModifiedDate = task.lastModifiedDate
                taskDB.tags = task.tags
                taskDB.showInWidgets = task.showInWidgets
                taskDB.showOnAppleWatch = task.showOnAppleWatch
                taskDB.showInComplications = task.showInComplications
                
                try self.saveContextIfNeeded()
            }
        }
    }
    
    public func deleteTask(_ task: TaskItem) async throws {
        try await context.perform {
            let request: NSFetchRequest<TaskDB> = TaskDB.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", task.id as CVarArg)
            let results = try self.context.fetch(request)
            if let taskDB = results.first {
                self.context.delete(taskDB)
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

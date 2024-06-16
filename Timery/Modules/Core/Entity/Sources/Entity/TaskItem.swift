//
//  TaskItem.swift
//
//
//  Created by Leo on 6/10/24.
//

import Foundation
import CoreData

public struct TaskItem {
    public let id: UUID
    public var name: String
    public var projectId: UUID?
    public var desc: String
    public var startTime: Date?
    public var endTime: Date?
    public var lastModifiedDate: Date
    public var tags: String
    public var showInWidgets: Bool
    public var showOnAppleWatch: Bool
    public var showInComplications: Bool
    
    public init(
        id: UUID = UUID(),
        name: String,
        projectId: UUID? = nil,
        desc: String = "",
        startTime: Date = Date(),
        endTime: Date? = nil,
        lastModifiedDate: Date = Date(),
        tags: String = "",
        showInWidgets: Bool = false,
        showOnAppleWatch: Bool = false,
        showInComplications: Bool = false) {
        
        self.id = id
        self.name = name
        self.projectId = projectId
        self.desc = desc
        self.startTime = startTime
        self.endTime = endTime
        self.lastModifiedDate = lastModifiedDate
        self.tags = tags
        self.showInWidgets = showInWidgets
        self.showOnAppleWatch = showOnAppleWatch
        self.showInComplications = showInComplications
    }
}

extension TaskItem: DatabaseEntity {
    @discardableResult
    public func toDB(context: NSManagedObjectContext) -> TaskDB {
        let taskDB = TaskDB(context: context)
        taskDB.id = self.id
        taskDB.name = self.name
        taskDB.projectId = self.projectId
        taskDB.desc = self.desc
        taskDB.startTime = self.startTime
        taskDB.endTime = self.endTime
        taskDB.lastModifiedDate = self.lastModifiedDate
        taskDB.tags = self.tags
        taskDB.showInWidgets = self.showInWidgets
        taskDB.showOnAppleWatch = self.showOnAppleWatch
        taskDB.showInComplications = self.showInComplications
        return taskDB
    }
    
    public init(from taskDB: TaskDB) {
        self.id = taskDB.id ?? UUID()
        self.name = taskDB.name ?? ""
        self.projectId = taskDB.projectId
        self.desc = taskDB.desc ?? ""
        self.startTime = taskDB.startTime
        self.endTime = taskDB.endTime
        self.lastModifiedDate = taskDB.lastModifiedDate ?? Date()
        self.tags = taskDB.tags ?? ""
        self.showInWidgets = taskDB.showInWidgets
        self.showOnAppleWatch = taskDB.showOnAppleWatch
        self.showInComplications = taskDB.showInComplications
    }
}

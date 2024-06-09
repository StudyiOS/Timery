//
//  Task.swift
//
//
//  Created by Leo on 6/10/24.
//

import Foundation
import CoreData

public struct Task {
    public let id: UUID
    public var name: String
    public var projectId: UUID
    public var desc: String
    public var curTime: Float
    public var cumulativeTime: Float
    public var lastModifiedDate: Date
    public var tags: String
    public var showInWidgets: Bool
    public var showOnAppleWatch: Bool
    public var showInComplications: Bool
    
    public init(
        id: UUID,
        name: String,
        projectId: UUID,
        desc: String,
        curTime: Float,
        cumulativeTime: Float,
        lastModifiedDate: Date,
        tags: String,
        showInWidgets: Bool,
        showOnAppleWatch: Bool,
        showInComplications: Bool) {
        
        self.id = id
        self.name = name
        self.projectId = projectId
        self.desc = desc
        self.curTime = curTime
        self.cumulativeTime = cumulativeTime
        self.lastModifiedDate = lastModifiedDate
        self.tags = tags
        self.showInWidgets = showInWidgets
        self.showOnAppleWatch = showOnAppleWatch
        self.showInComplications = showInComplications
    }
}

extension Task {
    public func toTaskDB(context: NSManagedObjectContext) -> TaskDB {
        let taskDB = TaskDB(context: context)
        taskDB.id = self.id
        taskDB.name = self.name
        taskDB.projectId = self.projectId
        taskDB.desc = self.desc
        taskDB.curTime = self.curTime
        taskDB.cumulativeTime = self.cumulativeTime
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
        self.projectId = taskDB.projectId ?? UUID()
        self.desc = taskDB.desc ?? ""
        self.curTime = taskDB.curTime
        self.cumulativeTime = taskDB.cumulativeTime
        self.lastModifiedDate = taskDB.lastModifiedDate ?? Date()
        self.tags = taskDB.tags ?? ""
        self.showInWidgets = taskDB.showInWidgets
        self.showOnAppleWatch = taskDB.showOnAppleWatch
        self.showInComplications = taskDB.showInComplications
    }

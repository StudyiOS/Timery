//
//  TaskDB+CoreDataProperties.swift
//  
//
//  Created by Leo on 6/10/24.
//
//

import Foundation
import CoreData


extension TaskDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskDB> {
        return NSFetchRequest<TaskDB>(entityName: "TaskDB")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var projectId: UUID?
    @NSManaged public var desc: String?
    @NSManaged public var curTime: Float
    @NSManaged public var cumulativeTime: Float
    @NSManaged public var lastModifiedDate: Date?
    @NSManaged public var tags: String?
    @NSManaged public var showInWidgets: Bool
    @NSManaged public var showOnAppleWatch: Bool
    @NSManaged public var showInComplications: Bool

}

//
//  File.swift
//  
//
//  Created by Leo on 6/10/24.
//

import Foundation
import CoreData

public struct ProjectItem {
    public let id: UUID
    public var name: String
    public var rcolor: Float?
    public var gcolor: Float?
    public var bcolor: Float?
    public var acolor: Float?
    
    public init(
        id: UUID = UUID(),
        name: String,
        rcolor: Float?,
        gcolor: Float?,
        bcolor: Float?,
        acolor: Float?) {
        self.id = id
        self.name = name
        self.rcolor = rcolor
        self.gcolor = gcolor
        self.bcolor = bcolor
        self.acolor = acolor
    }
}

extension ProjectItem: DatabaseEntity {
    public func toDB(context: NSManagedObjectContext) -> ProjectDB {
        let projectDB = ProjectDB(context: context)
        projectDB.id = self.id
        projectDB.name = self.name
        projectDB.rcolor = self.rcolor ?? -1
        projectDB.gcolor = self.gcolor ?? -1
        projectDB.bcolor = self.bcolor ?? -1
        projectDB.acolor = self.acolor ?? -1
        return projectDB
    }
    
    public init(from projectDB: ProjectDB) {
        self.id = projectDB.id ?? UUID()
        self.name = projectDB.name ?? ""
        self.rcolor = projectDB.rcolor
        self.gcolor = projectDB.gcolor
        self.bcolor = projectDB.bcolor
        self.acolor = projectDB.acolor
    }
}

//
//  ProjectDB+CoreDataProperties.swift
//  
//
//  Created by Leo on 6/10/24.
//
//

import Foundation
import CoreData


extension ProjectDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProjectDB> {
        return NSFetchRequest<ProjectDB>(entityName: "ProjectDB")
    }

    @NSManaged public var acolor: Float
    @NSManaged public var bcolor: Float
    @NSManaged public var gcolor: Float
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var rcolor: Float

}

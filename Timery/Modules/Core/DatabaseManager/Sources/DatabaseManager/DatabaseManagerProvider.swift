//
//  DatabaseManagerProvider.swift
//
//
//  Created by Leo on 6/16/24.
//

import Foundation
import Entity

public class DatabaseManagerProvider {
    public static let taskItemManager = DatabaseManager<TaskItem>()
    public static let projectItemManager = DatabaseManager<ProjectItem>()
}

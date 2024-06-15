//
//  AppDelegate.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Entity
import DatabaseManager

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let task = TaskItem(name: "A Task")
        
        Task {
            try await DatabaseManager.shared.createTask(task)
            let task = try await DatabaseManager.shared.fetchAllTasks()
        }
        
        return true
    }
    
    func application(_ application: UIApplication,
                     didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
    }
}


//
//  DatabaseTests.swift
//  TimeryTests
//
//  Created by Leo on 6/16/24.
//

import XCTest
import Entity
import DatabaseManager
import CoreData

final class DatabaseTests: XCTestCase {
    
    private let taskDatabse = DatabaseManagerProvider.taskItemManager
    
    override func setUp() async throws {
        removeAllDatabse()
    }
        
    func testCreate() async throws {
        //Given
        let newTask1 = TaskItem(name: "새로운Task1 - \(Date())", startTime: Date())
        let newTask2 = TaskItem(name: "새로운Task2 - \(Date())", startTime: Date())
        
        // When
        try await taskDatabse.create(newTask1)
        try await taskDatabse.create(newTask2)
        
        // Then
        print("[CREATE] ---Created Tasks---")
        let tasks = try await taskDatabse.fetchAll()
        tasks.forEach {
            print($0.name)
        }
        
        XCTAssertTrue(tasks.count == 2, "추가한 Task가 2개가 아닙니다.")
    }
    
    func testFetchWithId() async throws {
        //Given
        let newTask1 = TaskItem(name: "새로운Task1 - \(Date())", startTime: Date())
        print(newTask1.id)
        try await taskDatabse.create(newTask1)
        
        // When
        let tasks = try await taskDatabse.fetchAll()
        
        if let taskID = tasks.first?.id,
           try await taskDatabse.fetch(with: taskID) != nil {
            //print("Fetched task : \(someTask.name)")
        } else {
            assertionFailure("Task를 찾을 수 없습니다.")
        }
    }
    
    func testUpdateWithId() async throws {
        //Given - task 추가
        let newTask1 = TaskItem(name: "새로운Task1 - \(Date())", startTime: Date())
        try await taskDatabse.create(newTask1)
        
        let pivotTaskId = try await taskDatabse.fetchAll().first?.id
        let newTaskName = "업데이트 테스크 - \(Date())"
        
        //When - task 이름 변경
        if let willUpdateTaskId = pivotTaskId {
            let willUpdateTask = TaskItem(id: willUpdateTaskId, name: newTaskName)
            try await taskDatabse.update(willUpdateTask)
        }
        
        //Then - 변경되었는지 확인
        if let updatedTaskId = pivotTaskId,
           let updatedTask = try await taskDatabse.fetch(with: updatedTaskId) {
            XCTAssertTrue(newTaskName == updatedTask.name, "업데이트 되지 않았습니다!!")
        } else {
            assertionFailure("Task를 찾을 수 없습니다.")
        }
    }
    
    func testDelete() async throws {
        //Given - task 추가
        let newTask1 = TaskItem(name: "새로운Task1 - \(Date())", startTime: Date())
        try await taskDatabse.create(newTask1)
        
        //When
        if let deleteTask = try await taskDatabse.fetchAll().first {
            try await taskDatabse.delete(deleteTask)
        }
        
        //Then
        let allTasks = try await taskDatabse.fetchAll()
        XCTAssertTrue(allTasks.isEmpty, "삭제되지 않았습니다")
    }
    
    private func removeAllDatabse() {
        Task {
            let allTasks = try await taskDatabse.fetchAll()
            for i in 0..<allTasks.count {
                try await taskDatabse.delete(allTasks[i])
            }
        }
        
        // 애플리케이션 도큐먼트 디렉토리 경로를 가져옴
        let storeDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        // 저장소 파일 이름을 지정
        let storeURL = storeDirectory.appendingPathComponent("Timery.sqlite")
        
        // 기존 저장소 파일을 삭제
        try? FileManager.default.removeItem(at: storeURL)
        
        let container = NSPersistentContainer(name: "Timery")
        let description = container.persistentStoreDescriptions.first
        description?.url = storeURL
        description?.shouldMigrateStoreAutomatically = true
        description?.shouldInferMappingModelAutomatically = true
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
}

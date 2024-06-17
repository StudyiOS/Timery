import XCTest
import Entity
@testable import DatabaseManager

//TODO: Mock DB 넣는 방법 리서치 필요
//final class DatabaseManagerTests: XCTestCase {
//    
//    private let taskDatabse = DatabaseManagerProvider.taskItemManager
//    
//    override func setUp() async throws {
//        removeAllDatabse()
//    }
//    
//    private func removeAllDatabse() {
//        Task {
//            let allTasks = try await taskDatabse.fetchAll()
//            for i in 0..<allTasks.count {
//                try await taskDatabse.delete(allTasks[i])
//            }
//        }
//    }
//    
//    func testCreate() async throws {
//            //Given
//        let newTask1 = TaskItem(name: "새로운Task1 - \(Date())", startTime: Date())
//        let newTask2 = TaskItem(name: "새로운Task2 - \(Date())", startTime: Date())
//        // When
//        try await taskDatabse.create(newTask1)
//        try await taskDatabse.create(newTask2)
//        
//        // Then
//        print("[CREATE] ---Created Tasks---")
//        let tasks = try await taskDatabse.fetchAll()
//        tasks.forEach {
//            print($0.name)
//        }
//        
//        XCTAssertFalse(tasks.count == 1, "추가한 Task가 2개가 아닙니다.")
//    }
//            if let taskID = tasks.first?.id,
//               let someTask = try await database.fetch(with: taskID) {
//                print("[READ] ---First Task---")
//                print(someTask.name)
//            }
//            
//            //UPDATE
//            if let updateTaskId = tasks.first?.id {
//                print("[UPDATE] ---\(tasks.first?.name ?? "") will be updated---")
//                let updatedTask = TaskItem(id: updateTaskId, name: "업데이트 테스크 - \(Date())")
//                try await database.update(updatedTask)
//                let tasks = try await database.fetchAll()
//                print("[UPDATE] ---After update---")
//                tasks.forEach {
//                    print($0.name)
//                }
//            }
//            
//            //DELETE
//            if let deleteTask = tasks.first {
//                print("[DELETE] \(deleteTask.name) will be deleted")
//                try await database.delete(deleteTask)
//                print("[DELETE] ---After delete---")
//                let tasks = try await database.fetchAll()
//                tasks.forEach {
//                    print($0.name)
//                }
//            }
//        }

//    }
//}

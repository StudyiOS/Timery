//
//  TimeEntriesVM.swift
//
//
//  Created by Leo on 6/23/24.
//

import Foundation

// 원하는 구조로 바꿀 것
final class TimeEntriesVM {
    private let coordinator: TimeEntriesFlowCoordinatorProtocol
    
    init(coordinator: TimeEntriesFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

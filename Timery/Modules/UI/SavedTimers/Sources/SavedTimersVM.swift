//
//  SavedTimersVM.swift
//
//
//  Created by Leo on 6/23/24.
//

import Foundation

// 원하는 구조로 바꿀 것
final class SavedTimersVM {
    private let coordinator: SavedTimersFlowCoordinatorProtocol
    
    init(coordinator: SavedTimersFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

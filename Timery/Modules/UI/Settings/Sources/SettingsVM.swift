//
//  SettingsVM.swift
//
//
//  Created by Leo on 6/23/24.
//

import Foundation

// 원하는 구조로 바꿀 것
final class SettingsVM {
    private let coordinator: SettingsFlowCoordinatorProtocol
    
    init(coordinator: SettingsFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

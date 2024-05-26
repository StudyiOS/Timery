//
//  TestDetailReactor.swift
//
//
//  Created by Leo on 5/26/24.
//

import Foundation

public final class TestDetailReactor {
    private let coordinator: TestDetailFlowCoordinatorProtocol
    
    public init(coordinator: TestDetailFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func finish() {
        coordinator.finish()
    }
}

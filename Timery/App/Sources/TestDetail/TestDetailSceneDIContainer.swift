//
//  TestDetailSceneDIContainer.swift
//  Timery
//
//  Created by Leo on 5/26/24.
//

import UIKit
import TestDetail

final class TestDetailSceneDIContainer: TestDetailFlowCoordinatorDependencies {
    
    func makeTestDetailCoordinator(
        navigationController: UINavigationController,
        appFlowCoordinator: AppFlowCoordinator
    ) -> TestDetailFlowCoordinatorProtocol {
        TestDetailFlowCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: appFlowCoordinator,
            dependencies: self
        )
    }
    
    func makeTestDetailVC(
        coordinator: TestDetailFlowCoordinatorProtocol
    ) -> TestDetailVC {
        TestDetailVC(
            reactor: makeTestDetailReactor(
                coordinator: coordinator
            )
        )
    }
    
    private func makeTestDetailReactor(
        coordinator: TestDetailFlowCoordinatorProtocol
    ) -> TestDetailReactor {
        TestDetailReactor(coordinator: coordinator)
    }
    
}

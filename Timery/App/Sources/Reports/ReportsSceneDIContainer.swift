//
//  ReportsSceneDIContainer.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import Reports

final class ReportsSceneDIContainer: ReportsFlowCoordinatorDependencies {
    
    func makeReportsCoordinator(
        navigationController: UINavigationController,
        appFlowCoordinator: AppFlowCoordinator
    ) -> ReportsFlowCoordinatorProtocol {
        ReportsFlowCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: appFlowCoordinator,
            dependencies: self
        )
    }
    
    func makeReportsVC(
        coordinator: ReportsFlowCoordinatorProtocol
    ) -> UIViewController {
        ReportsFactory.create(with: coordinator)
    }
}

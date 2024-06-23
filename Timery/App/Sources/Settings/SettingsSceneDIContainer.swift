//
//  SettingsSceneDIContainer.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import Settings

final class SettingsSceneDIContainer: SettingsFlowCoordinatorDependencies {
    
    func makeSettingsCoordinator(
        navigationController: UINavigationController,
        appFlowCoordinator: AppFlowCoordinator
    ) -> SettingsFlowCoordinatorProtocol {
        SettingsFlowCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: appFlowCoordinator,
            dependencies: self
        )
    }
    
    func makeSettingsVC(
        coordinator: SettingsFlowCoordinatorProtocol
    ) -> UIViewController {
        SettingsFactory.create(with: coordinator)
    }
}


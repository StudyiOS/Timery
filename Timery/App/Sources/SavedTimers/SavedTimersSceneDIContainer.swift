//
//  SavedTimersSceneDIContainer.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import SavedTimers

final class SavedTimersSceneDIContainer: SavedTimersFlowCoordinatorDependencies {
    
    func makeSavedTimersCoordinator(
        navigationController: UINavigationController,
        appFlowCoordinator: AppFlowCoordinator
    ) -> SavedTimersFlowCoordinatorProtocol {
        SavedTimersFlowCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: appFlowCoordinator,
            dependencies: self
        )
    }
    
    func makeSavedTimersVC(
        coordinator: SavedTimersFlowCoordinatorProtocol
    ) -> UIViewController {
        SavedTimersFactory.create(with: coordinator)
    }
}


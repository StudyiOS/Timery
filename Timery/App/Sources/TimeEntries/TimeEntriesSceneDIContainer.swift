//
//  TimeEntriesSceneDIContainer.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import TimeEntries

final class TimeEntriesSceneDIContainer: TimeEntriesFlowCoordinatorDependencies {
    
    func makeTimeEntriesCoordinator(
        navigationController: UINavigationController,
        appFlowCoordinator: AppFlowCoordinator
    ) -> TimeEntriesFlowCoordinatorProtocol {
        TimeEntriesFlowCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: appFlowCoordinator,
            dependencies: self
        )
    }
    
    func makeTimeEntriesVC(
        coordinator: TimeEntriesFlowCoordinatorProtocol
    ) -> UIViewController {
        TimeEntriesFactory.create(with: coordinator)
    }
}


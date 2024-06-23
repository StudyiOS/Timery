//
//  TimeEntriesCoordinator.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import TimeEntries

final class TimeEntriesFlowCoordinator: TimeEntriesFlowCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    private let dependencies: TimeEntriesFlowCoordinatorDependencies
    private weak var appFlowCoordinator: AppFlowCoordinator?
    
    init(navigationController: UINavigationController,
         appFlowCoordinator: AppFlowCoordinator,
         dependencies: TimeEntriesFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.appFlowCoordinator = appFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        // TODO: AppFlow -> Home -> TimeEntries Tab
    }
        
    func finish() {
//        navigationController.popViewController(animated: true)
    }
}

//
//  SavedTimersCoordinator.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import SavedTimers

final class SavedTimersFlowCoordinator: SavedTimersFlowCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    private let dependencies: SavedTimersFlowCoordinatorDependencies
    private weak var appFlowCoordinator: AppFlowCoordinator?
    
    init(navigationController: UINavigationController,
         appFlowCoordinator: AppFlowCoordinator,
         dependencies: SavedTimersFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.appFlowCoordinator = appFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        // TODO: AppFlow -> Home -> SavedTimers Tab
    }
        
    func finish() {
//        navigationController.popViewController(animated: true)
    }
}

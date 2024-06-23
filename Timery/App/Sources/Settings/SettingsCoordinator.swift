//
//  SettingsCoordinator.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import Settings

final class SettingsFlowCoordinator: SettingsFlowCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    private let dependencies: SettingsFlowCoordinatorDependencies
    private weak var appFlowCoordinator: AppFlowCoordinator?
    
    init(navigationController: UINavigationController,
         appFlowCoordinator: AppFlowCoordinator,
         dependencies: SettingsFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.appFlowCoordinator = appFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        // TODO: AppFlow -> Home -> Settings Tab
    }
        
    func finish() {
//        navigationController.popViewController(animated: true)
    }
}

//
//  ReportsCoordinator.swift
//  Timery
//
//  Created by Leo on 6/23/24.
//

import UIKit
import Reports

final class ReportsFlowCoordinator: ReportsFlowCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    private let dependencies: ReportsFlowCoordinatorDependencies
    private weak var appFlowCoordinator: AppFlowCoordinator?
    
    init(navigationController: UINavigationController,
         appFlowCoordinator: AppFlowCoordinator,
         dependencies: ReportsFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.appFlowCoordinator = appFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        // TODO: AppFlow -> Home -> Reports Tab
    }
        
    func finish() {
//        navigationController.popViewController(animated: true)
    }
}

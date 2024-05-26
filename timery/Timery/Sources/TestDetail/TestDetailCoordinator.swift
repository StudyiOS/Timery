//
//  TestDetailCoordinator.swift
//  Timery
//
//  Created by Leo on 5/26/24.
//

import UIKit
import TestDetail

final class TestDetailFlowCoordinator: TestDetailFlowCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    private let dependencies: TestDetailFlowCoordinatorDependencies
    private weak var appFlowCoordinator: AppFlowCoordinator?
    
    init(navigationController: UINavigationController,
         appFlowCoordinator: AppFlowCoordinator,
         dependencies: TestDetailFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.appFlowCoordinator = appFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeTestDetailVC(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
        
    func finish() {
        navigationController.popViewController(animated: true)
    }
}

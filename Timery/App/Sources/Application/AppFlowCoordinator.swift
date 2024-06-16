//
//  AppFlowCoordinator.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Home
import TestDetail

final class AppFlowCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
   
    private var homeFlowCoordinator: HomeFlowCoordinatorProtocol?
    private var testDetailFlowCoordinator: TestDetailFlowCoordinatorProtocol?
    
    init(navigationController: UINavigationController,
         appDIContainer: AppDIContainer) {

        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
    }
    
    func startHomeFlow() {
        let homeSceneDIContainer = appDIContainer.makeHomeSceneDIConatiner()
        homeFlowCoordinator = homeSceneDIContainer.makeHomeFlowCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: self
        )
        homeFlowCoordinator?.start()
    }
    
    func startTestDetailFlow() {
        let testDetailSceneDIContainer = appDIContainer.makeTestDetailSceneDIContainer()
        testDetailFlowCoordinator = testDetailSceneDIContainer.makeTestDetailCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: self
        )
        testDetailFlowCoordinator?.start()
    }
}

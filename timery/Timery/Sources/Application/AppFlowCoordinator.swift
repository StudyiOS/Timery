//
//  AppFlowCoordinator.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Home

final class AppFlowCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
   
    private var homeFlowCoordinator: HomeFlowCoordinatorProtocol?
//    private var settingsFlowCoordinator: SettingsFlowCoordinatorProtocol?
    
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
    
//    func startSettingsFlow() {
//        let settingsSceneDIContainer = appDIContainer.makeSettingsSceneDIContainer()
//        settingsFlowCoordinator = settingsSceneDIContainer.makeSettingsFlowCoordinator(
//            navigationController: navigationController,
//            appFlowCoordinator: self
//        )
//        settingsFlowCoordinator?.start()
//    }
}

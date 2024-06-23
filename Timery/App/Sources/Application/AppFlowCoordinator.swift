//
//  AppFlowCoordinator.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Home
import TestDetail
import Reports

final class AppFlowCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
   
    private var homeFlowCoordinator: HomeFlowCoordinatorProtocol?
    private var testDetailFlowCoordinator: TestDetailFlowCoordinatorProtocol?
    private var reportsFlowCoordinator: ReportsFlowCoordinatorProtocol?

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
        
        startReportsFlow() // home flow 시작전 초기화
        
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
    
    func startReportsFlow() {
        let reportsSceneDIContainer = appDIContainer.makeReportsSceneDIContainer()
        reportsFlowCoordinator = reportsSceneDIContainer.makeReportsCoordinator(
            navigationController: navigationController, 
            appFlowCoordinator: self
        )
        reportsFlowCoordinator?.start()
    }
    
    func createReportsVC() -> UIViewController {
        let reportsSceneDIContainer = appDIContainer.makeReportsSceneDIContainer()
        guard let reportsFlowCoordinator = reportsFlowCoordinator else {
            fatalError("ReportsFlowCoordinator NIL")
        }
        return reportsSceneDIContainer.makeReportsVC(coordinator: reportsFlowCoordinator)
    }
}

//
//  AppFlowCoordinator.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Home
import TestDetail
import TimeEntries
import SavedTimers
import Reports
import Settings

final class AppFlowCoordinator {
    var navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
   
    private var homeFlowCoordinator: HomeFlowCoordinatorProtocol?
    private var testDetailFlowCoordinator: TestDetailFlowCoordinatorProtocol?
    private var timeEntriesFlowCoordinator: TimeEntriesFlowCoordinatorProtocol?
    private var savedTimersFlowCoordinator: SavedTimersFlowCoordinatorProtocol?
    private var reportsFlowCoordinator: ReportsFlowCoordinatorProtocol?
    private var settingsFlowCoordinator: SettingsFlowCoordinatorProtocol?

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
        
        // home flow 시작전 초기화
        startTimeEntriesFlow()
        startReportsFlow()
        startSavedTimersFlow()
        startSettingsFlow()
        
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
    
    func startTimeEntriesFlow() {
        let timeEntriesSceneDIContainer = appDIContainer.makeTimeEntriesSceneDIContainer()
        timeEntriesFlowCoordinator = timeEntriesSceneDIContainer.makeTimeEntriesCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: self
        )
        timeEntriesFlowCoordinator?.start()
    }
    
    func createTimeEntriesVC() -> UIViewController {
        let timeEntriesSceneDIContainer = appDIContainer.makeTimeEntriesSceneDIContainer()
        guard let timeEntriesFlowCoordinator = timeEntriesFlowCoordinator else {
            fatalError("timeEntriesFlowCoordinator nil")
        }
        return timeEntriesSceneDIContainer.makeTimeEntriesVC(coordinator: timeEntriesFlowCoordinator)
    }
    
    func startSavedTimersFlow() {
        let savedTimersSceneDIContainer = appDIContainer.makeSavedTimersSceneDIContainer()
        savedTimersFlowCoordinator = savedTimersSceneDIContainer.makeSavedTimersCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: self
        )
        savedTimersFlowCoordinator?.start()
    }
    
    func createSavedTimersVC() -> UIViewController {
        let savedTimersSceneDIContainer = appDIContainer.makeSavedTimersSceneDIContainer()
        guard let savedTimersFlowCoordinator = savedTimersFlowCoordinator else {
            fatalError("savedTimersFlowCoordinator nil")
        }
        return savedTimersSceneDIContainer.makeSavedTimersVC(coordinator: savedTimersFlowCoordinator)
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
            fatalError("ReportsFlowCoordinator nil")
        }
        return reportsSceneDIContainer.makeReportsVC(coordinator: reportsFlowCoordinator)
    }

    func startSettingsFlow() {
        let settingsSceneDIContainer = appDIContainer.makeSettingsSceneDIContainer()
        settingsFlowCoordinator = settingsSceneDIContainer.makeSettingsCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: self
        )
        settingsFlowCoordinator?.start()
    }
    
    func createSettingsVC() -> UIViewController {
        let settingsSceneDIContainer = appDIContainer.makeSettingsSceneDIContainer()
        guard let settingsFlowCoordinator = settingsFlowCoordinator else {
            fatalError("settingsFlowCoordinator nil")
        }
        return settingsSceneDIContainer.makeSettingsVC(coordinator: settingsFlowCoordinator)
    }

}

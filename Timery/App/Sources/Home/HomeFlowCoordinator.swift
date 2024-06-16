//
//  HomeFlowCoordinator.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Home

final class HomeFlowCoordinator: HomeFlowCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    private let dependencies: HomeFlowCoordinatorDependencies
    private weak var appFlowCoordinator: AppFlowCoordinator?
    
    init(navigationController: UINavigationController,
         appFlowCoordinator: AppFlowCoordinator,
         dependencies: HomeFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.appFlowCoordinator = appFlowCoordinator
        self.dependencies = dependencies
    }
    
    func start() {
        let vc = dependencies.makeHomeVC(coordinator: self)
        navigationController.pushViewController(vc, animated: false)
    }
        
    func showTestDetail() {
        appFlowCoordinator?.startTestDetailFlow()
    }
    
    // TODO: 각 VC들의 Dependency를 생성 후 가져와야함
    func getSavedTimersVC() -> UIViewController {
        SavedTimersVC()
    }
    
    func getTimeEntriesVC() -> UIViewController  {
        TimeEntriesVC()
    }
    
    func getReportsVC() -> UIViewController {
        ReportsVC()
    }
    
    func getSettingsVC() -> UIViewController  {
        SettingsVC()
    }
}

//
//  HomeFlowCoordinator.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Home
import Reports

final class HomeFlowCoordinator: HomeFlowCoordinatorProtocol {
    
    private let navigationController: UINavigationController
    private let homeDependencies: HomeFlowCoordinatorDependencies
    private weak var appFlowCoordinator: AppFlowCoordinator?
    
    init(
        navigationController: UINavigationController,
        appFlowCoordinator: AppFlowCoordinator,
        homeDependencies: HomeFlowCoordinatorDependencies
    ) {
        self.navigationController = navigationController
        self.appFlowCoordinator = appFlowCoordinator
        self.homeDependencies = homeDependencies
    }
    
    func start() {
        let vc = homeDependencies.makeHomeVC(coordinator: self)
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
        guard let appFlowCoordinator else {
            fatalError("appFlowCoordinator nil")
        }
        return appFlowCoordinator.createReportsVC()
    }
    
    func getSettingsVC() -> UIViewController  {
        SettingsVC()
    }
}

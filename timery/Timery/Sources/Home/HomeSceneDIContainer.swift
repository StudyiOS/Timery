//
//  HomeDIContainer.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Home

final class HomeSceneDIContainer: HomeFlowCoordinatorDependencies {
    
    /*
    struct Dependenceis {
     let apiService: APIService
     let databaseService: DatabaseService
    }
     private let dependencies: Dependencies
     
     init(dependencies: Dependencies) {
       self.dependencies = dependencies
     }
     
     func makeDBViewModel(coordinator, databaseService) {
        ~~
     }
     */
    
    func makeHomeFlowCoordinator(
        navigationController: UINavigationController,
        appFlowCoordinator: AppFlowCoordinator
    ) -> HomeFlowCoordinatorProtocol {
        return HomeFlowCoordinator(
            navigationController: navigationController,
            appFlowCoordinator: appFlowCoordinator,
            dependencies: self
        )
    }
    
    func makeHomeVC(
        coordinator: HomeFlowCoordinatorProtocol
    ) -> HomeVC {
        return HomeVC(
            viewModel: makeHomeVM(
                coordinator: coordinator
            )
        )
    }
    
    private func makeHomeVM(
        coordinator: HomeFlowCoordinatorProtocol
    ) -> HomeVM {
        HomeVM(coordinator: coordinator)
    }
    
    
}

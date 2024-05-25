//
//  AppDIContainer.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import Foundation

final class AppDIContainer {
    lazy var appConfiguration = AppConfiguration()
    
//    let apiDataTranserferService = DataTransferService()
    
    func makeHomeSceneDIConatiner() -> HomeSceneDIContainer {
        return HomeSceneDIContainer()
    }
    
//    func makeSettingsSceneDIContainer() -> SettingsSceneDIContainer {
//        let dependencies = SettingsSceneDIContainer.Dependencies()
//        return SettingsSceneDIContainer(dependencies: dependencies)
//    }
}

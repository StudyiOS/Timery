//
//  HomeFlowCoordinatorProtocol.swift
//
//
//  Created by Leo on 5/25/24.
//

import UIKit

public protocol HomeFlowCoordinatorProtocol {
    func start()
    func showTestDetail()
    func getSavedTimersVC() -> UIViewController
    func getTimeEntriesVC() -> UIViewController
    func getReportsVC() -> UIViewController
    func getSettingsVC() -> UIViewController
}

public protocol HomeFlowCoordinatorDependencies {
    func makeHomeVC(coordinator: HomeFlowCoordinatorProtocol) -> HomeVC
}


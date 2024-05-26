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
}

public protocol HomeFlowCoordinatorDependencies {
    func makeHomeVC(coordinator: HomeFlowCoordinatorProtocol) -> HomeVC
}


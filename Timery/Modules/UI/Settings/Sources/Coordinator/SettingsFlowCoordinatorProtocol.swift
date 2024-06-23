//
//  SettingsFlowCoordinatorProtocol.swift
//
//
//  Created by Leo on 6/23/24.
//

import UIKit

public protocol SettingsFlowCoordinatorProtocol {
    func start()
}

public protocol SettingsFlowCoordinatorDependencies {
    func makeSettingsVC(coordinator: SettingsFlowCoordinatorProtocol) -> UIViewController
}

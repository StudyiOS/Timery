//
//  SavedTimersFlowCoordinatorProtocol.swift
//
//
//  Created by Leo on 6/23/24.
//

import UIKit

public protocol SavedTimersFlowCoordinatorProtocol {
    func start()
}

public protocol SavedTimersFlowCoordinatorDependencies {
    func makeSavedTimersVC(coordinator: SavedTimersFlowCoordinatorProtocol) -> UIViewController
}

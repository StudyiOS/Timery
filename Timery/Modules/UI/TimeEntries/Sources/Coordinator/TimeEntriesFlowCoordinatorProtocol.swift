//
//  TimeEntriesFlowCoordinatorProtocol.swift
//
//
//  Created by Leo on 6/23/24.
//

import UIKit

public protocol TimeEntriesFlowCoordinatorProtocol {
    func start()
}

public protocol TimeEntriesFlowCoordinatorDependencies {
    func makeTimeEntriesVC(coordinator: TimeEntriesFlowCoordinatorProtocol) -> UIViewController
}

//
//  ReportsFlowCoordinatorProtocol.swift
//
//
//  Created by Leo on 6/23/24.
//

import UIKit

public protocol ReportsFlowCoordinatorProtocol {
    func start()
//    func share()
//    func showConfigureMenu()
//    func navigateToSummaryReport()
}

public protocol ReportsFlowCoordinatorDependencies {
    func makeReportsVC(coordinator: ReportsFlowCoordinatorProtocol) -> UIViewController
}


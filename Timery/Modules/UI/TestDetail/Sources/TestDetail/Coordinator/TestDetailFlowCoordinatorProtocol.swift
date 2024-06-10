//
//  TestDetailFlowCoordinatorProtocol.swift
//
//
//  Created by Leo on 5/26/24.
//

import UIKit

public protocol TestDetailFlowCoordinatorProtocol {
    func start()
    func finish()
}

public protocol TestDetailFlowCoordinatorDependencies {
    func makeTestDetailVC(coordinator: TestDetailFlowCoordinatorProtocol) -> TestDetailVC
}

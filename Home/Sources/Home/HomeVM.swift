//
//  HomeViewModel.swift
//
//
//  Created by Leo on 5/25/24.
//

import Foundation

public final class HomeVM {
    let welcomeText = "Hello Timery!"
    
    private let coordinator: HomeFlowCoordinatorProtocol
    
    public init(coordinator: HomeFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func showTestDetail() {
        coordinator.showTestDetail()
    }
}

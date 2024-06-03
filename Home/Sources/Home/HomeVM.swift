//
//  HomeViewModel.swift
//
//
//  Created by Leo on 5/25/24.
//

import UIKit
import Combine

public final class HomeVM {

    var tabBarItems: [UIViewController] {
        TimeryTab.allCases.map {
            buildTabBarVC(
                for: getContentVC($0),
                title: $0.tabTitle,
                image: $0.tabIcon
            )
        }
    }

    private let coordinator: HomeFlowCoordinatorProtocol
    
    public init(coordinator: HomeFlowCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    func showTestDetail() {
        coordinator.showTestDetail()
    }
    
    private func getContentVC(_ tab: TimeryTab) -> UIViewController {
        switch tab {
        case .savedTimers: coordinator.getSavedTimersVC()
        case .timeEntries: coordinator.getTimeEntriesVC()
        case .reports: coordinator.getReportsVC()
        case .settings: coordinator.getSettingsVC()
        }
    }
    
    private func buildTabBarVC(
        for rootVC: UIViewController,
        title: String?,
        image: UIImage
    ) -> UIViewController {
        let vc = UINavigationController(rootViewController:  rootVC)
        vc.navigationBar.isTranslucent = false
        vc.navigationBar.backgroundColor = .white
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        vc.interactivePopGestureRecognizer?.delegate = nil
        return vc
    }

}

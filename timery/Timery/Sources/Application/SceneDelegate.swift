//
//  SceneDelegate.swift
//  Timery
//
//  Created by Leo on 5/25/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    let appDIContainer = AppDIContainer()
    var appFlowCoordinator: AppFlowCoordinator?
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }

        let navigationController = UINavigationController()
        window = UIWindow(windowScene: scene)
        window?.rootViewController = navigationController
        
        appFlowCoordinator = AppFlowCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        appFlowCoordinator?.startHomeFlow()
        
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
    
}


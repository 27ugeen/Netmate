//
//  SceneDelegate.swift
//  Netmate
//
//  Created by GiN Eugene on 25/7/2022.
//

import UIKit
import LocalAuthentication

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let localAuthContext = LAContext()
        let rootVC = UIViewController()
        
        let localAuthorizationService = LocalAuthorizationService(localAuthContext: localAuthContext)
        
        let mainVC = MainViewController()
        let profileVC = ProfileViewController()
        let favVC = FavoriteViewController()
        
        let mainCoord = MainCoordinator(rootViewController: rootVC, mainVC: mainVC)
        let profileCoord = ProfileCoordinator(rootViewController: rootVC, profileVC: profileVC)
        let favCoord = FavoriteCoordinator(rootViewController: rootVC, favVC: favVC)
        
        let appCoordinator = AppCoordinator(mainCoordinator: mainCoord, profileCoordinator: profileCoord, favoriteCoordinator: favCoord)
        
        let onBoardingVC = OnboardingViewController(coordinator: appCoordinator, localAuthorizationService: localAuthorizationService)
        let onBoardingNavVC = UINavigationController(rootViewController: onBoardingVC)
        
        window?.rootViewController = onBoardingNavVC
    }

}


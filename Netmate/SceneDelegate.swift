//
//  SceneDelegate.swift
//  Netmate
//
//  Created by GiN Eugene on 25/7/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
//        let onBoardingVC = OnboardingViewController()
        let onBoardingVC = ProfileViewController()
        let onBoardingNavVC = UINavigationController(rootViewController: onBoardingVC)
        
        
        
        window?.rootViewController = onBoardingNavVC
    }

}


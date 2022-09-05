//
//  SceneDelegate.swift
//  Netmate
//
//  Created by GiN Eugene on 25/7/2022.
//

import UIKit
import CoreData
import LocalAuthentication
import iOSIntPackage

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.makeKeyAndVisible()
        
        let localAuthContext = LAContext()
        let rootVC = UIViewController()
        
        let localAuthorizationService = LocalAuthorizationService(localAuthContext: localAuthContext)
        
        let imgPubFascade = ImagePublisherFacade()
        
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "DataBaseModel")
            container.loadPersistentStores { description, error in
                if let error = error {
                    fatalError("Unable to load persistent stores: \(error)")
                }
            }
            return container
        }()

        
        let context = persistentContainer.newBackgroundContext()
        let dbManager = DataBaseManager(persistentContainer: persistentContainer, backgroundContext: context)
        
        
        let mainVM = MainViewModel(dbManager: dbManager)
        let profileVM = ProfileViewModel()
        let favVM = FavoriteViewModel(dbManager: dbManager)
        let infoVM = InfoViewModel()
        let feedMenuVM = FeedMenuViewModel()
        let profileMenuVM = MenuViewModel()
        let followerVM = FollowerViewModel()
        
        let mainVC = MainViewController(mainVM: mainVM)
        let profileVC = ProfileViewController()
        let favVC = FavoriteViewController(favoriteViewModel: favVM)
        
        let mainCoord = MainCoordinator(rootViewController: rootVC,
                                        mainVC: mainVC,
                                        infoVM: infoVM,
                                        feedMenuVM: feedMenuVM,
                                        followerVM: followerVM,
                                        imagePublisherFacade: imgPubFascade)
        
        let profileCoord = ProfileCoordinator(rootViewController: rootVC,
                                              profileVC: profileVC,
                                              infoVM: infoVM,
                                              menuVM: profileMenuVM,
                                              profileVM: profileVM,
                                              imgPubFascade: imgPubFascade)
        
        let favCoord = FavoriteCoordinator(rootViewController: rootVC,
                                           favVC: favVC)
        
        let appCoordinator = AppCoordinator(mainCoordinator: mainCoord,
                                            profileCoordinator: profileCoord,
                                            favoriteCoordinator: favCoord)
        
        let onBoardingVC = OnboardingViewController(coordinator: appCoordinator,
                                                    localAuthorizationService: localAuthorizationService)
        
        let onBoardingNavVC = UINavigationController(rootViewController: onBoardingVC)
        
        window?.rootViewController = onBoardingNavVC
    }
    
    func changeRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard let window = self.window else { return }
        window.rootViewController = vc
        // add animation
        UIView.transition(with: window,
                          duration: 0.42,
                          options: .transitionFlipFromLeft,
                          animations: nil,
                          completion: nil)
    }
}


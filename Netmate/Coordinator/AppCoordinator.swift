//
//  AppCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

protocol AppBaseCoordinatorProtocol: CoordinatorProtocol {
    var mainCoordinator: MainBaseCoordinatorProtocol { get }
    var profileCoordinator: ProfileBaseCoordinatorProtocol { get }
    var favoriteCoordinator: FavoriteBaseCoordinatorProtocol { get }
}

final class AppCoordinator: AppBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    
    var rootViewController: UIViewController = UITabBarController()
    
    let mainCoordinator: MainBaseCoordinatorProtocol
    let profileCoordinator: ProfileBaseCoordinatorProtocol
    let favoriteCoordinator: FavoriteBaseCoordinatorProtocol
    
    //MARK: - init
    init (mainCoordinator: MainBaseCoordinatorProtocol, profileCoordinator: ProfileBaseCoordinatorProtocol, favoriteCoordinator: FavoriteCoordinator) {
        self.mainCoordinator = mainCoordinator
        self.profileCoordinator = profileCoordinator
        self.favoriteCoordinator = favoriteCoordinator
    }
    
    //MARK: - Localization
//    let barProfile = "bar_profile".localized()
//    let barFeed = "bar_feed".localized()
//    let barFavorite = "bar_favorite".localized()
//    let barMap = "bar_map".localized()
    
    //MARK: - methods
    func start() -> UIViewController {
        let mainNavVC = mainCoordinator.start()
        mainCoordinator.parentCoordinator = self
        mainNavVC.tabBarItem = UITabBarItem(title: "Main", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let profileNavVC = profileCoordinator.start()
        profileCoordinator.parentCoordinator = self
        profileNavVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 1)
        
        let favoriteNavVC = favoriteCoordinator.start()
        favoriteCoordinator.parentCoordinator = self
        favoriteNavVC.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "star.square.fill"), tag: 2)
        
        (rootViewController as? UITabBarController)?.viewControllers = [mainNavVC, profileNavVC, favoriteNavVC]
        
        return rootViewController
    }
}

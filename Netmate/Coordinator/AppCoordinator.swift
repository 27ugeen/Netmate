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
    
    //MARK: - localization
    private let barMain = "bar_main_title".localized()
    private let barProf = "bar_prof_title".localized()
    private let barFav = "bar_fav_title".localized()

    //MARK: - methods
    func start() -> UIViewController {
        let mainNavVC = mainCoordinator.start()
        mainCoordinator.parentCoordinator = self
        mainNavVC.tabBarItem = UITabBarItem(title: barMain, image: UIImage(named: "house"), tag: 0)
        
        
        let profileNavVC = profileCoordinator.start()
        profileCoordinator.parentCoordinator = self
        profileNavVC.tabBarItem = UITabBarItem(title: barProf, image: UIImage(named: "person"), tag: 1)
        
        let favoriteNavVC = favoriteCoordinator.start()
        favoriteCoordinator.parentCoordinator = self
        favoriteNavVC.tabBarItem = UITabBarItem(title: barFav, image: UIImage(named: "heart"), tag: 2)
        
        let tabBC = UITabBarController()
        tabBC.viewControllers = [mainNavVC, profileNavVC, favoriteNavVC]

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBC)
   
        return tabBC
    }
}

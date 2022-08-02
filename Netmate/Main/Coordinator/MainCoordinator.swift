//
//  MainCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

protocol MainBaseCoordinatorProtocol: CoordinatorProtocol {
    
}

class MainCoordinator: MainBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let mainVC: MainViewController
    
    //MARK: - init
    init(rootViewController: UIViewController, mainVC: MainViewController) {
        self.rootViewController = rootViewController
        self.mainVC = mainVC
    }
    //MARK: - methods
    func start() -> UIViewController {
        mainVC.goToProfileVCAction = {
            self.goToProfileVC()
        }
        
        mainVC.goToFollowerVCAction = { idx in
            self.goToFollowerVC(idx)
        }
        
        mainVC.goToFeedDetailVCAction = {
            self.goToFeedDetailVC()
        }
        
        rootViewController = UINavigationController(rootViewController: mainVC)
        return rootViewController
    }
    
    func goToProfileVC() {
        rootViewController.tabBarController?.selectedIndex = 1
    }
    
    func goToFollowerVC(_ index: Int) {
        let followerVC = FollowerViewController(idx: index)
        navigationRootViewController?.pushViewController(followerVC, animated: true)
    }
    
    func goToFeedDetailVC() {
        let feedDetailVC = FeedDetailViewController()
        navigationRootViewController?.pushViewController(feedDetailVC, animated: true)
    }
    
}

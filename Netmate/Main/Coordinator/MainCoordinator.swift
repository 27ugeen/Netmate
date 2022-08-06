//
//  MainCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

protocol MainBaseCoordinatorProtocol: CoordinatorProtocol {
    func goToProfileVC()
    func goToFollowerVC(_ index: Int)
}

class MainCoordinator: MainBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let mainVC: MainViewController
    private let feedMenuVM: FeedMenuViewModel
    
    //MARK: - init
    init(rootViewController: UIViewController, mainVC: MainViewController, feedMenuVM: FeedMenuViewModel) {
        self.rootViewController = rootViewController
        self.mainVC = mainVC
        self.feedMenuVM = feedMenuVM
    }
    //MARK: - methods
    func start() -> UIViewController {
        mainVC.goToProfileVCAction = {
            self.goToProfileVC()
        }
        
        mainVC.goToFollowerVCAction = { idx in
            self.goToFollowerVC(idx)
        }
        
        mainVC.goToFeedDetailVCAction = { user, idx in
            self.goToFeedDetailVC(user, idx)
        }
        
        mainVC.goToFeedMenuVCAction = {
            self.goToFeedMenuVC()
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
    
    func goToFeedDetailVC(_ model: User, _ index: Int) {
        let feedDetailVC = FeedDetailViewController(feedIdx: index)
        feedDetailVC.model = model
        feedDetailVC.feedIdx = index
        navigationRootViewController?.pushViewController(feedDetailVC, animated: true)
    }
    
    func goToFeedMenuVC() {
        let feedMenuVC = FeedMenuViewController(feedMenuVM: feedMenuVM)
        feedMenuVC.transitioningDelegate = mainVC
        feedMenuVC.modalPresentationStyle = .custom
        feedMenuVC.menuAction = {
            feedMenuVC.dismiss(animated: true)
        }
        navigationRootViewController?.present(feedMenuVC, animated: true)
    }
    
}

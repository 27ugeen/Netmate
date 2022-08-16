//
//  MainCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit
import iOSIntPackage

protocol MainBaseCoordinatorProtocol: CoordinatorProtocol {
    func goToProfileVC()
//    func goToFollowerVC(_ index: Int)
}

class MainCoordinator: MainBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let mainVC: MainViewController
    private let infoVM: InfoViewModel
    private let feedMenuVM: FeedMenuViewModel
    private let followerVM: FollowerViewModel
    private let imagePublisherFacade: ImagePublisherFacade
    
    //MARK: - init
    init(rootViewController: UIViewController, mainVC: MainViewController, infoVM: InfoViewModel, feedMenuVM: FeedMenuViewModel, followerVM: FollowerViewModel, imagePublisherFacade: ImagePublisherFacade) {
        self.rootViewController = rootViewController
        self.mainVC = mainVC
        self.infoVM = infoVM
        self.followerVM = followerVM
        self.feedMenuVM = feedMenuVM
        
        self.imagePublisherFacade = imagePublisherFacade
    }
    //MARK: - methods
    func start() -> UIViewController {
        mainVC.goToProfileVCAction = {
            self.goToProfileVC()
        }
        
        mainVC.goToFollowerVCAction = { id in
            self.goToFollowerVC(id)
        }
        
        mainVC.goToFeedDetailVCAction = { feed in
            self.goToFeedDetailVC(feed)
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
    
    func goToFollowerVC(_ userId: String) {
        let followerVC = FollowerViewController(userId: userId, followerVM: followerVM)
        
        followerVC.goToInfoVCAction = {
            let infoVC = InfoViewController(infoVM: self.infoVM)
            infoVC.transitioningDelegate = followerVC
            infoVC.modalPresentationStyle = .custom
            self.navigationRootViewController?.present(infoVC, animated: true)
            
            infoVC.cancelAction = {
                infoVC.dismiss(animated: true)
            }
        }
        
        followerVC.goToFeedDetailVCAction = { feedModel in
            let feedDetailVC = FeedDetailViewController()
            feedDetailVC.model = feedModel
            self.navigationRootViewController?.pushViewController(feedDetailVC, animated: true)
        }
        
        followerVC.goToPhotoGalleryAction = { photoArr in
            let photoVC = PhotoViewController(imagePublisherFacade: self.imagePublisherFacade)
            photoVC.model = photoArr
            self.navigationRootViewController?.pushViewController(photoVC, animated: true)
        }
        
        navigationRootViewController?.pushViewController(followerVC, animated: true)
    }
    
    func goToFeedDetailVC(_ model: FeedStub) {
        let feedDetailVC = FeedDetailViewController()
        feedDetailVC.model = model
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

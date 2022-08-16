//
//  FavoriteCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

protocol FavoriteBaseCoordinatorProtocol: CoordinatorProtocol {
    
}

class FavoriteCoordinator: FavoriteBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let favVC: FavoriteViewController
    
    //MARK: - init
    init(rootViewController: UIViewController, favVC: FavoriteViewController) {
        self.rootViewController = rootViewController
        self.favVC = favVC
    }
    //MARK: - methods
    func start() -> UIViewController {
        favVC.goToSearchAction = { [weak self] in
            self?.goToSearchVC()
        }
        
        favVC.goToFeedDetailAction = { feed in
            self.goToFeedDetailVC(feed)
        }
        
        rootViewController = UINavigationController(rootViewController: favVC)
        return rootViewController
    }
    
    func goToSearchVC() {
        let searchVC = FavoriteSearchViewController()
        searchVC.transitioningDelegate = favVC
        searchVC.modalPresentationStyle = .custom
        searchVC.filterAction = favVC.getFilteredFeed
        navigationRootViewController?.present(searchVC, animated: true)
    }
    
    func goToFeedDetailVC(_ model: FeedStub) {
        let feedDetailVC = FeedDetailViewController()
        feedDetailVC.model = model
        navigationRootViewController?.pushViewController(feedDetailVC, animated: true)
    }
}

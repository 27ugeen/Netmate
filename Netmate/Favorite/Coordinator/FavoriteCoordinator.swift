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
        
        rootViewController = UINavigationController(rootViewController: favVC)
        return rootViewController
    }
    
}

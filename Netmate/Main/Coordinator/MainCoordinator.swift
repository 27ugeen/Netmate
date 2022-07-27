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
        
        rootViewController = UINavigationController(rootViewController: mainVC)
        return rootViewController
    }
    
}

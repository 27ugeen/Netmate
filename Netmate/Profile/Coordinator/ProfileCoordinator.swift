//
//  ProfileCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

protocol ProfileBaseCoordinatorProtocol: CoordinatorProtocol {
    
}

class ProfileCoordinator: ProfileBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let profileVC: ProfileViewController
    
    //MARK: - init
    init(rootViewController: UIViewController, profileVC: ProfileViewController) {
        self.rootViewController = rootViewController
        self.profileVC = profileVC
    }
    //MARK: - methods
    func start() -> UIViewController {
        
        rootViewController = UINavigationController(rootViewController: profileVC)
        return rootViewController
    }
    
}

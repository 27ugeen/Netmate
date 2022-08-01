//
//  ProfileCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit
import iOSIntPackage

protocol ProfileBaseCoordinatorProtocol: CoordinatorProtocol {
    
}

class ProfileCoordinator: ProfileBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let profileVC: ProfileViewController
    private let infoVM: InfoViewModel
    
    //MARK: - init
    init(rootViewController: UIViewController, profileVC: ProfileViewController, infoVM: InfoViewModel) {
        self.rootViewController = rootViewController
        self.profileVC = profileVC
        self.infoVM = infoVM
    }
    //MARK: - methods
    func start() -> UIViewController {
        profileVC.goToInfoVCAction = { [weak self] in
            self?.goToInfoVC()
        }
        
        profileVC.goToEditVCAction = { [weak self] in
            self?.goToProfEditVC()
            
        }
        
        profileVC.goToPhotoGalleryAction = { [weak self] in
            self?.goToPhotoVC()
            
        }
        
        rootViewController = UINavigationController(rootViewController: profileVC)
        return rootViewController
    }
    
    func goToInfoVC() {
        let infoVC = InfoViewController(infoVM: infoVM)
        navigationRootViewController?.present(infoVC, animated: true)
    }
    
    func goToProfEditVC() {
        let profEditVC = ProfileEditViewController()
        navigationRootViewController?.pushViewController(profEditVC, animated: true)
    }
    
    func goToPhotoVC() {
        let imgPubFascade = ImagePublisherFacade()
        let photoVC = PhotoViewController(imagePublisherFacade: imgPubFascade)
        navigationRootViewController?.pushViewController(photoVC, animated: true)
    }
}

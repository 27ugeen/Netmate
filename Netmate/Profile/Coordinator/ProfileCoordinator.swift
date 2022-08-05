//
//  ProfileCoordinator.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit
import iOSIntPackage

protocol ProfileBaseCoordinatorProtocol: CoordinatorProtocol {
    func showSmallVC(vc: UIViewController, transition: TransitionType)
    func goToMenuVC()
    func goToInfoVC()
    func goToPhotoVC()
}

class ProfileCoordinator: ProfileBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let profileVC: ProfileViewController
    private let infoVM: InfoViewModel
    private let menuVM: MenuViewModel
    private let profileVM: ProfileViewModel
    
    //MARK: - init
    init(rootViewController: UIViewController, profileVC: ProfileViewController, infoVM: InfoViewModel, menuVM: MenuViewModel, profileVM: ProfileViewModel) {
        self.rootViewController = rootViewController
        self.profileVC = profileVC
        self.infoVM = infoVM
        self.menuVM = menuVM
        self.profileVM = profileVM
    }
    //MARK: - methods
    func start() -> UIViewController {
        profileVC.goToProfileMenuVCAction = { [weak self] in
            self?.goToMenuVC()
        }
        
        profileVC.goToProfileFeedMenuVCAction = { [weak self] in
            self?.goToFeedMenuVC()
        }
        
        profileVC.goToInfoVCAction = { [weak self] in
            self?.goToInfoVC()
        }
        
        profileVC.goToEditVCAction = { [weak self] in
            self?.goToProfEditVC()
        }
        
        profileVC.goToPhotoGalleryAction = { [weak self] in
            self?.goToPhotoVC()
        }
        
        profileVC.goToFeedDetailAction = { model, idx in
            self.goToFeedDetailVC(model, idx)
        }
        
        rootViewController = UINavigationController(rootViewController: profileVC)
        return rootViewController
    }
    
    func showSmallVC(vc: UIViewController, transition: TransitionType) {
        profileVC.transitionType = transition
        
        vc.transitioningDelegate = profileVC
        vc.modalPresentationStyle = .custom
        navigationRootViewController?.present(vc, animated: true)
    }
    
    func goToMenuVC() {
        let menuVC = MenuViewController(menuVM: menuVM)
        self.showSmallVC(vc: menuVC, transition: .slide(fromDirection: .right))
        menuVC.backAction = {
            self.navigationRootViewController?.dismiss(animated: true)
        }
    }
    
    func goToFeedMenuVC() {
        let feedMenuVC =  ProfileFeedMenuViewController(profileFeedMenuVM: profileVM)
        self.showSmallVC(vc: feedMenuVC, transition: .bubble)
        feedMenuVC.menuAction = {
            self.navigationRootViewController?.dismiss(animated: true)
        }
    }
    
    func goToInfoVC() {
        let infoVC = InfoViewController(infoVM: infoVM)
        self.showSmallVC(vc: infoVC, transition: .slide(fromDirection: .right))
        infoVC.cancelAction = {
            self.navigationRootViewController?.dismiss(animated: true)
        }
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
    
    func goToFeedDetailVC(_ model: User, _ index: Int) {
        let feedDetailVC = FeedDetailViewController()
        feedDetailVC.model = model
        feedDetailVC.feedIdx = index
        navigationRootViewController?.pushViewController(feedDetailVC, animated: true)
    }
}

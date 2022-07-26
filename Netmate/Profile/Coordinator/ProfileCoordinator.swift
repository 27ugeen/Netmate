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
    func goToPhotoVC(_ photo: [PhotoStub])
}

class ProfileCoordinator: ProfileBaseCoordinatorProtocol {
    //MARK: - props
    var parentCoordinator: AppBaseCoordinatorProtocol?
    var rootViewController: UIViewController
    private let profileVC: ProfileViewController
    private let infoVM: InfoViewModel
    private let menuVM: MenuViewModel
    private let profileVM: ProfileViewModel
    private let imgPubFascade: ImagePublisherFacade
    
    //MARK: - init
    init(rootViewController: UIViewController, profileVC: ProfileViewController, infoVM: InfoViewModel, menuVM: MenuViewModel, profileVM: ProfileViewModel, imgPubFascade: ImagePublisherFacade) {
        self.rootViewController = rootViewController
        self.profileVC = profileVC
        self.infoVM = infoVM
        self.menuVM = menuVM
        self.profileVM = profileVM
        self.imgPubFascade = imgPubFascade
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
        
        profileVC.goToPhotoGalleryAction = { photoArr in
            self.goToPhotoVC(photoArr)
        }
        
        profileVC.goToFeedDetailAction = { feed in
            self.goToFeedDetailVC(feed)
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
    
    func goToPhotoVC(_ photo: [PhotoStub]) {
        let photoVC = PhotoViewController(imagePublisherFacade: imgPubFascade)
        photoVC.model = photo
        navigationRootViewController?.pushViewController(photoVC, animated: true)
    }
    
    func goToFeedDetailVC(_ model: FeedStub) {
        let feedDetailVC = FeedDetailViewController()
        feedDetailVC.model = model
        navigationRootViewController?.pushViewController(feedDetailVC, animated: true)
    }
}

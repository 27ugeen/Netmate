//
//  LoginViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 25/7/2022.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    //MARK: - props
    private let appCoordinator: AppCoordinator
    private let localAuthorizationService: LocalAuthorizationService
    
    //MARK: - localization
    private let titleRegister = "reg_btn".localized()
    private let titleGoToSignin = "go_to_signin_btn".localized()

    //MARK: - subviews
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let logoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")
        image.backgroundColor = .white
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var registerButton = MagicButton(title: titleRegister, titleColor: Palette.btnWithBordTitleColor) {
        let regVC = RegisterViewController()
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(regVC, animated: true)
    }
    
    private lazy var goToSigninButton = MagicButton(title: titleGoToSignin, titleColor: Palette.btnNoBordTitleColor) {
//        self.isUserExists = !self.isUserExists
        let signInVC = SignInViewController(coordinator: self.appCoordinator, localAuthorizationService: self.localAuthorizationService)
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(signInVC, animated: true)
    }
    //MARK: - localization
    
    //MARK: - init
    init(coordinator: AppCoordinator, localAuthorizationService: LocalAuthorizationService) {
        self.appCoordinator = coordinator
        self.localAuthorizationService = localAuthorizationService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupViews()
    }
    
    //MARK: - methods
    private func setupButtons() {
        registerButton.setBackgroundColor(Palette.btnWithBordColor, forState: .normal)
        registerButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        registerButton.titleLabel?.font = UIFont.setMedFont(16)
        registerButton.layer.cornerRadius = 8
        registerButton.clipsToBounds = true
        
        goToSigninButton.titleLabel?.font = UIFont.setMedFont(14)
    }

}
//MARK: - setupViews
extension OnboardingViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoImage)
        contentView.addSubview(registerButton)
        contentView.addSubview(goToSigninButton)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            logoImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 250),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor),
            
            registerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 56),
            registerButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 100),
            registerButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -56),
            registerButton.heightAnchor.constraint(equalToConstant: 48),
            
            goToSigninButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 56),
            goToSigninButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 30),
            goToSigninButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -56),
            goToSigninButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            goToSigninButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
//MARK: - UNUserNotificationCenterDelegate
extension OnboardingViewController: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case UNNotificationDefaultActionIdentifier:
            print("default action")
        case "actionUpdates":
            print("need updates")
            showAlertOk(message: "Need install updates")
        case "actionCancel":
            print("action canceled")
        default:
            break
        }
        completionHandler()
    }
}

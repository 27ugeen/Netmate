//
//  AuthorizationViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class AuthorizationViewController: UIViewController {
    //MARK: - props
    private let localAuthorizationService: LocalAuthorizationService
    
    var viewTappedAction: (() -> Void)?
    
    //MARK: - subviews
    private lazy var authorizeView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .red
        view.contentMode = .scaleAspectFit
        view.isUserInteractionEnabled = true
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTupped)))
        return view
    }()

    //MARK: - init
    init(localAuthorizationService: LocalAuthorizationService) {
        self.localAuthorizationService = localAuthorizationService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    //MARK: - methods
    @objc private func viewTupped() {
        self.viewTappedAction?()
        self.dismiss(animated: true)
    }
    //MARK: - setupViews
    private func setupViews() {
        self.view.backgroundColor = .systemGray6.withAlphaComponent(0.5)
        self.view.addSubview(authorizeView)
        
        switch localAuthorizationService.biometryType {
        case .faceID:
            self.authorizeView.image = UIImage(systemName: "faceid")
        default:
            self.authorizeView.image = UIImage(systemName: "touchid")
        }
        
        NSLayoutConstraint.activate([
            authorizeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorizeView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            authorizeView.widthAnchor.constraint(equalToConstant: 50),
            authorizeView.heightAnchor.constraint(equalTo: authorizeView.widthAnchor)
        ])
    }
}


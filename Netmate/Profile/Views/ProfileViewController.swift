//
//  ProfileViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit
import BonsaiController

class ProfileViewController: UIViewController {
    //MARK: - props
    private let headerCellID = ProfileHeaderTableViewCell.cellId
    private let buttonsCellID = ProfileButtonsTableViewCell.cellId
    private let subscriptCellID = ProfileSubscribtionTableViewCell.cellId
    private let photoCellID = PhotoTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    private let profileModel = UserStorage.tableModel[0]
    
    var goToInfoVCAction: (() -> Void)?
    var goToEditVCAction: (() -> Void)?
    var goToPhotoGalleryAction: (() -> Void)?
    var goToFeedDetailAction: (() -> Void)?
    
    //MARK: - subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setNormFont(16)
        label.text = "gin_apple_sd"
        return label
    }()
    
    private lazy var menuBarButton = UIBarButtonItem(image: UIImage(named: "3lines"), style: .plain, target: self, action: #selector(menuTapped))
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = Palette.appTintColor
        tableView.separatorStyle = .none
        return tableView
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarView()
        setupViews()
    }
    //MARK: - methods
    private func setupTabBarView() {
        let leftBarTitle = UIBarButtonItem.init(customView: titleLabel)
        self.navigationItem.setLeftBarButtonItems([leftBarTitle], animated: true)
        self.navigationItem.setRightBarButtonItems([menuBarButton], animated: true)
        self.navigationController?.navigationBar.tintColor = Palette.accentTextColor
    }
    @objc private func menuTapped() {
        let menuVC = MenuViewController(menuVM: MenuViewModel().self)
        menuVC.transitioningDelegate = self
        menuVC.modalPresentationStyle = .custom
        self.present(menuVC, animated: true)
        
        menuVC.backAction = {
            self.dismiss(animated: true)
        }
//        self.goToMenuAction?()
    }

}
//MARK: - setupViews
extension ProfileViewController {
    private func setupViews() {
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView.register(ProfileButtonsTableViewCell.self, forCellReuseIdentifier: buttonsCellID)
        tableView.register(ProfileSubscribtionTableViewCell.self, forCellReuseIdentifier: subscriptCellID)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: photoCellID)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserStorage.tableModel[0].feed.count + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellID) as! ProfileHeaderTableViewCell
        let buttonsCell = tableView.dequeueReusableCell(withIdentifier: buttonsCellID) as! ProfileButtonsTableViewCell
        let subscriptCell = tableView.dequeueReusableCell(withIdentifier: subscriptCellID) as! ProfileSubscribtionTableViewCell
        let photoCell = tableView.dequeueReusableCell(withIdentifier: photoCellID) as! PhotoTableViewCell
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID) as! FeedTableViewCell
        
        switch indexPath.row {
        case 0:
            headerCell.selectionStyle = .none
            headerCell.avatarImage.image = profileModel.avatar
            headerCell.fullNameLabel.text = "\(profileModel.firstName) \(profileModel.lastName)"
            headerCell.profLabel.text = "\(profileModel.profession)"
            
            headerCell.goToInfoAction = {
                let infoVC = InfoViewController(infoVM: InfoViewModel().self)
                infoVC.transitioningDelegate = self
                infoVC.modalPresentationStyle = .custom
                self.present(infoVC, animated: true)
                
                infoVC.cancelAction = {
                    self.dismiss(animated: true)
                }
//                self.goToInfoVCAction?()
            }
            return headerCell
        case 1:
            buttonsCell.goToEditAction = {
                self.goToEditVCAction?()
            }
            return buttonsCell
        case 2:
            return subscriptCell
        case 3:
            photoCell.selectionStyle = .none
            photoCell.model = profileModel
            return photoCell
        default:
            feedCell.authorImageView.image = profileModel.avatar
            feedCell.authorLabel.text = "\(profileModel.firstName) \(profileModel.lastName)"
            feedCell.descriptLabel.text = "\(profileModel.profession)"
            feedCell.model = profileModel.feed[indexPath.row - 4]
            
            feedCell.showMoreAction = {
                self.goToFeedDetailAction?()
            }
            return feedCell
        }
    }

}
//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 3 {
            self.goToPhotoGalleryAction?()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 96
        case 1:
            return 86
        case 2:
            return 91
        case 3:
            return 140
        default:
            return 400
        }
    }
}
//MARK: - BonsaiControllerDelegate
extension ProfileViewController: BonsaiControllerDelegate {
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: containerViewFrame.height / 8, y: 0), size: CGSize(width: containerViewFrame.width / (4/3), height: containerViewFrame.height))
    }
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .right, backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)
    }
}

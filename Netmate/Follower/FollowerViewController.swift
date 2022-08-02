//
//  FollowerViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 1/8/2022.
//

import UIKit
import iOSIntPackage
import BonsaiController

class FollowerViewController: UIViewController {
    //MARK: - props
    private let headerCellID = ProfileHeaderTableViewCell.cellId
    private let buttonsCellID = FollowerButtonsTableViewCell.cellId
    private let photoCellID = PhotoTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    var goToInfoVCAction: (() -> Void)?
//    var goToEditVCAction: (() -> Void)?
//    var goToPhotoGalleryAction: (() -> Void)?
    
    //MARK: - subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setNormFont(16)
        label.text = "user_profile_name"
        return label
    }()
    
    private lazy var backBarButton = UIBarButtonItem(image: UIImage(named: "backArrow"), style: .plain, target: self, action: #selector(backTapped))
    
    private lazy var menuBarButton = UIBarButtonItem(image: UIImage(named: "3dots"), style: .plain, target: self, action: #selector(menuTapped))
    
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
        self.navigationItem.setLeftBarButtonItems([backBarButton, leftBarTitle], animated: true)
        self.navigationItem.setRightBarButtonItems([menuBarButton], animated: true)
        self.navigationController?.navigationBar.tintColor = Palette.accentTextColor
    }
    @objc private func menuTapped() {
        print("follower menu btn tapped")
    }
    @objc private func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - setupViews
extension FollowerViewController {
    private func setupViews() {
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView.register(FollowerButtonsTableViewCell.self, forCellReuseIdentifier: buttonsCellID)
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
extension FollowerViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellID) as! ProfileHeaderTableViewCell
        let buttonsCell = tableView.dequeueReusableCell(withIdentifier: buttonsCellID) as! FollowerButtonsTableViewCell
        let photoCell = tableView.dequeueReusableCell(withIdentifier: photoCellID) as! PhotoTableViewCell
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID) as! FeedTableViewCell

        switch indexPath.row {
        case 0:
            headerCell.selectionStyle = .none
            headerCell.goToInfoAction = {
                let infoVC = InfoViewController(infoVM: InfoViewModel().self)
                infoVC.transitioningDelegate = self
                infoVC.modalPresentationStyle = .custom
                self.present(infoVC, animated: true)
                
                infoVC.cancelAction = {
                    self.dismiss(animated: true)
                }
            }
            return headerCell
        case 1:
            return buttonsCell
        case 2:
            photoCell.selectionStyle = .none
            return photoCell
        default:
            feedCell.selectionStyle = .none
            feedCell.showMoreAction = {
                let vc = FeedDetailViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return feedCell
        }
    }

}
//MARK: - UITableViewDelegate
extension FollowerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 2 {
            let photoVC = PhotoViewController(imagePublisherFacade: ImagePublisherFacade().self)
            self.navigationController?.pushViewController(photoVC, animated: true)
//            self.goToPhotoGalleryAction?()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 96
        case 1:
            return 86
        case 2:
            return 140
        default:
            return 400
        }
    }
}
//MARK: - BonsaiControllerDelegate
extension FollowerViewController: BonsaiControllerDelegate {

    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {

        return CGRect(origin: CGPoint(x: containerViewFrame.height / 8, y: 0), size: CGSize(width: containerViewFrame.width / (4/3), height: containerViewFrame.height))

//        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 4), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / 3))
    }

    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {

        /// With Background Color ///

        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .right, backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)

        // or Bubble animation initiated from a view
//        return BonsaiController(fromView: UIView(), backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)


        /// With Blur Style ///

        // Slide animation from .left, .right, .top, .bottom
        //return BonsaiController(fromDirection: .bottom, blurEffectStyle: .light, presentedViewController: presented, delegate: self)

        // or Bubble animation initiated from a view
//        return BonsaiController(fromView: UIView(), blurEffectStyle: .systemChromeMaterialDark,  presentedViewController: presented, delegate: self)
    }
}

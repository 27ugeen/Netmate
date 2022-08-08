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
    private let subscriptCellID = ProfileSubscribtionTableViewCell.cellId
    private let photoCellID = PhotoTableViewCell.cellId
    private let userNotesCellID = ProfileUserNotesTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    var idx: Int
    
    var goToInfoVCAction: (() -> Void)?
    var goToFeedDetailVCAction: ((_ model: User, _ idx: Int) -> Void)?
    var goToPhotoGalleryAction: (() -> Void)?
    
    //MARK: - localization
    private var userNotes = "user_note_title".localized()
    
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
    
    private lazy var topSeparator = Separator(backgroundColor: Palette.separatorColor)
    
    //MARK: - init
    init(idx: Int) {
        self.idx = idx
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarView()
        setupViews()
    }
    //MARK: - methods
    private func setupTabBarView() {
        let profileModel = FeedStorage.tableModel[idx - 1]
        self.titleLabel.text = profileModel.nickName
        
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
        self.view.addSubview(topSeparator)
        self.view.addSubview(tableView)
        
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView.register(FollowerButtonsTableViewCell.self, forCellReuseIdentifier: buttonsCellID)
        tableView.register(ProfileSubscribtionTableViewCell.self, forCellReuseIdentifier: subscriptCellID)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: photoCellID)
        tableView.register(ProfileUserNotesTableViewCell.self, forCellReuseIdentifier: userNotesCellID)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellID)

        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            topSeparator.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            topSeparator.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            topSeparator.heightAnchor.constraint(equalToConstant: 0.5),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topSeparator.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension FollowerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedStorage.tableModel[idx - 1].feed.count + 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellID) as! ProfileHeaderTableViewCell
        let buttonsCell = tableView.dequeueReusableCell(withIdentifier: buttonsCellID) as! FollowerButtonsTableViewCell
        let subscriptCell = tableView.dequeueReusableCell(withIdentifier: subscriptCellID) as! ProfileSubscribtionTableViewCell
        let photoCell = tableView.dequeueReusableCell(withIdentifier: photoCellID) as! PhotoTableViewCell
        let userNotesCell = tableView.dequeueReusableCell(withIdentifier: userNotesCellID) as! ProfileUserNotesTableViewCell
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID) as! FeedTableViewCell

        let profileModel = FeedStorage.tableModel[idx - 1]
        switch indexPath.row {
        case 0:
            headerCell.selectionStyle = .none
            headerCell.avatarImage.image = profileModel.avatar
            headerCell.fullNameLabel.text = "\(profileModel.firstName) \(profileModel.lastName)"
            headerCell.profLabel.text = "\(profileModel.profession)"
            
            headerCell.goToInfoAction = {
                self.goToInfoVCAction?()
            }
            return headerCell
        case 1:
            return buttonsCell
        case 2:
            return subscriptCell
        case 3:
            photoCell.selectionStyle = .none
            photoCell.model = profileModel
            return photoCell
        case 4:
            userNotesCell.searchButton.isHidden = true
            userNotesCell.titleLabel.text = "\(profileModel.firstName)'s \(userNotes)"
            return userNotesCell
        default:
            feedCell.selectionStyle = .none
            feedCell.model = profileModel.feed[indexPath.row - 5]
            
            feedCell.authorLabel.text = "\(profileModel.firstName) \(profileModel.lastName)"
            feedCell.authorImageView.image = profileModel.avatar
            feedCell.descriptLabel.text = profileModel.profession
            
            feedCell.showMoreAction = {
                self.goToFeedDetailVCAction?(profileModel, indexPath.row - 5)
            }
            return feedCell
        }
    }

}
//MARK: - UITableViewDelegate
extension FollowerViewController: UITableViewDelegate {
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
            return 165
        case 4:
            return 40
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
    }
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .right, backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)
    }
}

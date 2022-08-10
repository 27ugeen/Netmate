//
//  ProfileViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit
import BonsaiController

enum TransitionType {
    case none
    case bubble
    case slide(fromDirection: Direction)
}

class ProfileViewController: UIViewController {
    //MARK: - props
    private let headerCellID = ProfileHeaderTableViewCell.cellId
    private let buttonsCellID = ProfileButtonsTableViewCell.cellId
    private let subscriptCellID = ProfileSubscribtionTableViewCell.cellId
    private let notesCellID = ProfileNotesTableViewCell.cellId
    private let photoCellID = PhotoTableViewCell.cellId
    private let userNotesCellID = ProfileUserNotesTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    private let profileModel = UserStorage.tableModel[0]
    
    var transitionType: TransitionType = .none
    
    var goToProfileMenuVCAction: (() -> Void)?
    var goToProfileFeedMenuVCAction: (() -> Void)?
    var goToInfoVCAction: (() -> Void)?
    var goToEditVCAction: (() -> Void)?
    var goToPhotoGalleryAction: (() -> Void)?
    var goToFeedDetailAction: ((_ model: UserStub, _ idx: Int) -> Void)?
    
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
        self.goToProfileMenuVCAction?()
    }
}
//MARK: - setupViews
extension ProfileViewController {
    private func setupViews() {
        self.title = "Profile"
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView.register(ProfileButtonsTableViewCell.self, forCellReuseIdentifier: buttonsCellID)
        tableView.register(ProfileSubscribtionTableViewCell.self, forCellReuseIdentifier: subscriptCellID)
        tableView.register(ProfileNotesTableViewCell.self, forCellReuseIdentifier: notesCellID)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: photoCellID)
        tableView.register(ProfileUserNotesTableViewCell.self, forCellReuseIdentifier: userNotesCellID)
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
//        return UserStorage.tableModel[0].feed.count + 6
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellID) as! ProfileHeaderTableViewCell
        let buttonsCell = tableView.dequeueReusableCell(withIdentifier: buttonsCellID) as! ProfileButtonsTableViewCell
        let subscriptCell = tableView.dequeueReusableCell(withIdentifier: subscriptCellID) as! ProfileSubscribtionTableViewCell
        let notesCell = tableView.dequeueReusableCell(withIdentifier: notesCellID) as! ProfileNotesTableViewCell
        let photoCell = tableView.dequeueReusableCell(withIdentifier: photoCellID) as! PhotoTableViewCell
        let userNotesCell = tableView.dequeueReusableCell(withIdentifier: userNotesCellID) as! ProfileUserNotesTableViewCell
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID) as! FeedTableViewCell
        
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
            buttonsCell.goToEditAction = {
                self.goToEditVCAction?()
            }
            return buttonsCell
        case 2:
            return subscriptCell
        case 3:
            return notesCell
        case 4:
            photoCell.selectionStyle = .none
            photoCell.model = profileModel
            return photoCell
        case 5:
            return userNotesCell
        default:
            feedCell.authorImageView.image = profileModel.avatar
            feedCell.authorLabel.text = "\(profileModel.firstName) \(profileModel.lastName)"
            feedCell.descriptLabel.text = "\(profileModel.profession)"
            feedCell.model = profileModel.feed[indexPath.row - 6]
            
            feedCell.menuAction = {
                self.goToProfileFeedMenuVCAction?()
            }
            
            feedCell.showMoreAction = {
                self.goToFeedDetailAction?(self.profileModel, indexPath.row - 6)
            }
            return feedCell
        }
    }
}
//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 4 {
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
            return 90
        case 4:
            return 165
        case 5:
            return 40
        default:
            return 400
        }
    }
}
//MARK: - BonsaiControllerDelegate
extension ProfileViewController: BonsaiControllerDelegate {
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        switch transitionType {
        case .none:
            return CGRect(origin: .zero, size: containerViewFrame.size)
        case .bubble:
            return CGRect(origin: CGPoint(x: 50, y: containerViewFrame.height * 0.4), size: CGSize(width: containerViewFrame.width - 75, height: 248))
        case .slide:
            return CGRect(origin: CGPoint(x: containerViewFrame.height / 8, y: 0), size: CGSize(width: containerViewFrame.width / (4/3), height: containerViewFrame.height))
        }
    }
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        switch transitionType {
        case .none:
            return nil
        case .bubble:
            return BonsaiController(fromView: UIView(), backgroundColor: backgroundColor, presentedViewController: presented, delegate: self)
        case .slide(fromDirection: let fromDirection):
            return BonsaiController(fromDirection: fromDirection, backgroundColor: backgroundColor, presentedViewController: presented, delegate: self)
        }
    }
}

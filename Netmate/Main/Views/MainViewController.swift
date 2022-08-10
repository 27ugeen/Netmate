//
//  MainViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit
import BonsaiController

class MainViewController: UIViewController {
    //MARK: - props
    private let mainVM: MainViewModel
    private let headerCellID = MainHeaderTableViewCell.cellId
    private let friedsListCellID = FriendsListTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    var goToProfileVCAction: (() -> Void)?
    var goToFollowerVCAction: ((_ userId: String) -> Void)?
    var goToFeedDetailVCAction: ((_ model: FeedStub) -> Void)?
    var goToFeedMenuVCAction: (() -> Void)?
    
    var feedModel: [FeedStub] = [] {
        didSet { tableView.reloadData() }
    }
    
    var friendModel: [FriendStub] = [] {
        didSet { tableView.reloadData() }
    }
    
    //MARK: - localization
    private let titleBar = "bar_main_title".localized()
    
    //MARK: - subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = titleBar
        return label
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.automaticallyAdjustsScrollIndicatorInsets = false
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = Palette.appTintColor
        return tableView
    }()
    
    private lazy var searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searcAction))
    
    private lazy var bellBarButton = UIBarButtonItem(image: UIImage(systemName: "bell.fill"), style: .plain, target: self, action: #selector(bellTapped))
    
    //MARK: - init
    init(mainVM: MainViewModel) {
        self.mainVM = mainVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainVM.getFeedCollection() { feed in
            self.feedModel.append(feed)
        }
        mainVM.getFriendCollection() { friend in
            self.friendModel.append(friend)
        }
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupTabBarView()
    }
    //MARK: - methods
    private func setupTabBarView() {
        self.tabBarController?.tabBar.barTintColor = Palette.appTintColor
        self.tabBarController?.tabBar.isTranslucent = true
        self.tabBarController?.tabBar.tintColor = Palette.accentTextColor
        self.tabBarController?.tabBar.unselectedItemTintColor = Palette.mainTextColor
        
        let leftBarTitle = UIBarButtonItem.init(customView: titleLabel)
        self.navigationItem.setLeftBarButtonItems([leftBarTitle], animated: true)
        self.navigationItem.setRightBarButtonItems([bellBarButton, searchBarButton], animated: true)
        self.navigationController?.navigationBar.tintColor = Palette.mainTextColor
    }
    
    @objc private func searcAction() {
        print("main search btn tapped")
    }
    
    @objc private func bellTapped() {
        print("main bell btn tapped")
    }
    
    @objc private func tapEdit(_ recognizer: UITapGestureRecognizer)  {
        if recognizer.state == UIGestureRecognizer.State.ended {
            let tapLocation = recognizer.location(in: self.tableView)
            if let tapIndexPath = self.tableView.indexPathForRow(at: tapLocation) {
                if let tappedCell = self.tableView.cellForRow(at: tapIndexPath) as? FeedTableViewCell {
                    guard tapIndexPath.row > 1 else { return }
                    
                    tappedCell.model = feedModel[tapIndexPath.row - 2]
                    
                    mainVM.addToFavoriteFeed(tappedCell.model!) { message in
                        self.showAlertOk(message:  message ?? "")
                    }
                }
            }
        }
    }
}
//MARK: - setupConstraints
extension MainViewController {
    private func setupViews() {
        
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(MainHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: friedsListCellID)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellID)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapEdit(_:)))
        tapGesture.numberOfTapsRequired = 2
        tableView.addGestureRecognizer(tapGesture)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 63),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedModel.count + 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellID) as! MainHeaderTableViewCell
        let friedsListCell = tableView.dequeueReusableCell(withIdentifier: friedsListCellID) as! FriendsListTableViewCell
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID) as! FeedTableViewCell
        
        switch indexPath.row {
        case 0:
            headerCell.selectionStyle = .none
            return headerCell
        case 1:
//            let model = friendModel[indexPath.item - 1]
            friedsListCell.model = friendModel
            friedsListCell.goToProfileAction = {
                self.goToProfileVCAction?()
            }
            friedsListCell.goToFollowerAction = { userId in
                self.goToFollowerVCAction?(userId)
            }
            friedsListCell.selectionStyle = .none
            return friedsListCell
        default:
            feedCell.selectionStyle = .none
            let fModel = feedModel[indexPath.row - 2]
            feedCell.authorLabel.text = "\(fModel.name)"
            feedCell.descriptLabel.text = "\(fModel.prof)"
            feedCell.authorImageView.image = fModel.avatar
            
            feedCell.model = fModel
            
            feedCell.showMoreAction = {
                self.goToFeedDetailVCAction?(fModel)
            }
            
            feedCell.menuAction = {
                self.goToFeedMenuVCAction?()
            }
            
            feedCell.avatarAction = {
                self.goToFollowerVCAction?(fModel.userId)
            }
            return feedCell
        }
    }
}
//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 35
        case 1:
            return 76
        default:
            return 400
        }
    }
}
//MARK: - BonsaiControllerDelegate
extension MainViewController: BonsaiControllerDelegate {
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height * 0.7), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / 3))
    }
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .bottom, backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)
    }
}

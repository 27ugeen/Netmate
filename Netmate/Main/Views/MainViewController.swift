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
    private let headerCellID = MainHeaderTableViewCell.cellId
    private let friedsListCellID = FriendsListTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    var goToProfileVCAction: (() -> Void)?
    var goToFollowerVCAction: (() -> Void)?
    var goToFeedDetailVCAction: (() -> Void)?
    
    //MARK: - subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = "Main"
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
    
    private lazy var resetBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearFilter))
    
    private lazy var searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searcAction))
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
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
        self.navigationItem.setRightBarButtonItems([searchBarButton, resetBarButton], animated: true)
        self.navigationController?.navigationBar.tintColor = Palette.mainTextColor
    }
    
    @objc private func searcAction() {
        let searchVC = FavoriteSearchViewController()
        searchVC.transitioningDelegate = self
        searchVC.modalPresentationStyle = .custom
        self.navigationController?.present(searchVC, animated: true)
//        self.goToSearchAction?()
    }
    
    @objc private func clearFilter() {
        UserDefaults.standard.set("", forKey: "author")
//        favoriteViewModel.getAllFavoritePosts()
        tableView.reloadData()
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
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
            friedsListCell.selectionStyle = .none
            friedsListCell.goToProfileAction = {
                self.goToProfileVCAction?()
            }
            friedsListCell.goToFollowerAction = {
                self.goToFollowerVCAction?()
            }
            return friedsListCell
        default:
            feedCell.selectionStyle = .none
            feedCell.showMoreAction = {
                self.goToFeedDetailVCAction?()
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
        
//        return CGRect(origin: CGPoint(x: containerViewFrame.width / 2, y: 0), size: CGSize(width: containerViewFrame.width / (4/3), height: containerViewFrame.height / 4))
        
        return CGRect(origin: CGPoint(x: 24, y: containerViewFrame.height / 8), size: CGSize(width: containerViewFrame.width - 48, height: containerViewFrame.height / 4))
        
//        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 4), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / 3))
    }
    
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    
        /// With Background Color ///
    
        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .top, backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)
        
        // or Bubble animation initiated from a view
//        return BonsaiController(fromView: UIView(), backgroundColor: UIColor(white: 0, alpha: 0.5), presentedViewController: presented, delegate: self)
    
    
        /// With Blur Style ///
        
        // Slide animation from .left, .right, .top, .bottom
        //return BonsaiController(fromDirection: .bottom, blurEffectStyle: .light, presentedViewController: presented, delegate: self)
        
        // or Bubble animation initiated from a view
//        return BonsaiController(fromView: UIView(), blurEffectStyle: .systemUltraThinMaterialDark,  presentedViewController: presented, delegate: self)
    }
}

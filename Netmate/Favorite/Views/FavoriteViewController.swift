//
//  FavoriteViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit
import BonsaiController

class FavoriteViewController: UIViewController {
    //MARK: - props
//    private let favoriteViewModel: FavoriteViewModel
    private let feedCellID = FeedTableViewCell.cellId
    private let favSearchID = FavoriteSearchHeaderView.cellId
    
    var goToSearchAction: (() -> Void)?
    
    //MARK: - localization
//    private let postAuthor = "post_author".localized()
//    private let postViews = "post_views".localized()
//    private let filteredPosts = "filtered_posts".localized()
//    private let notFilteredPosts = "not_filtered_posts".localized()
//    private let favoriteVCTitle = "bar_favorite".localized()
//    private let postDeleteAction = "post_delete_action".localized()
//    private let findPostAlert = "find_post_alert".localized()
    
    //MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = 0
        return tableView
    }()
    
    private lazy var resetBarButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(clearFilter))
    
    private lazy var searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searcAction))
    
    //MARK: - init
//    init(favoriteViewModel: FavoriteViewModel) {
//        self.favoriteViewModel = favoriteViewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let author = UserDefaults.standard.string(forKey: "author")
        
        if let unwrappedAuthor = author {
            guard unwrappedAuthor == "" else {
                self.getFilteredPosts(filteredAuthor: unwrappedAuthor)
                return
            }
//            favoriteViewModel.getAllFavoritePosts()
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if favoriteViewModel.favoritePosts.isEmpty {
//            self.showAlert(message: findPostAlert)
//        }
    }
    //MARK: - methods
    func getFilteredPosts(filteredAuthor: String) {
        UserDefaults.standard.set(filteredAuthor, forKey: "author")
//        favoriteViewModel.getFilteredPosts(postAuthor: filteredAuthor)
        tableView.reloadData()
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
// MARK: - setupViews
extension FavoriteViewController {
    private func setupViews() {
        UserDefaults.standard.set("", forKey: "author")
        self.title = "Favorites"
        self.navigationItem.setRightBarButtonItems([searchBarButton, resetBarButton], animated: true)
        self.navigationController?.navigationBar.tintColor = Palette.mainTextColor
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellID)
        tableView.register(FavoriteSearchHeaderView.self, forHeaderFooterViewReuseIdentifier: favSearchID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
}
// MARK: - UITableViewDataSource
extension FavoriteViewController: UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return favoriteViewModel.favoritePosts.count
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID, for: indexPath) as! FeedTableViewCell
//        let postLikes = String.localizedStringWithFormat("post_likes".localized(), favoriteViewModel.favoritePosts[indexPath.row].likes)
        
//        cell.postAuthorLabel.text = "\(postAuthor): \(favoriteViewModel.favoritePosts[indexPath.row].author)"
//        cell.postTitleLabel.text = favoriteViewModel.favoritePosts[indexPath.row].title
//        cell.postImageView.image = favoriteViewModel.favoritePosts[indexPath.row].image
//        cell.postDescriptionLabel.text = favoriteViewModel.favoritePosts[indexPath.row].description
//        cell.postlikesLabel.text = postLikes
//        cell.postViewsLabel.text = "\(postViews): \(favoriteViewModel.favoritePosts[indexPath.row].views)"
        return feedCell
        
    }
}
// MARK: - UITableViewDelegate
extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: favSearchID) as! FavoriteSearchHeaderView
        
//        let author = UserDefaults.standard.string(forKey: "author")
//        if author != "" {
//            if let unwrappedAuthor = author {
////                headerView.searchLabel.text = "\(filteredPosts) \"\(unwrappedAuthor)\""
//            }
//        } else {
////            headerView.searchLabel.text = notFilteredPosts
//        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 405
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let post = favoriteViewModel.favoritePosts[indexPath.row]
//
//        let deleteAction = UIContextualAction(style: .destructive, title: postDeleteAction) { _, _, complete in
//            self.favoriteViewModel.removePostFromFavorite(post: post, index: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .automatic)
//            complete(true)
//        }
//        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
//        configuration.performsFirstActionWithFullSwipe = true
//        return configuration
//    }
}
//MARK: - BonsaiControllerDelegate
extension FavoriteViewController: BonsaiControllerDelegate {
    
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        
//        return CGRect(origin: CGPoint(x: containerViewFrame.width / 2, y: 0), size: CGSize(width: containerViewFrame.width / (4/3), height: containerViewFrame.height / 4))
        
        return CGRect(origin: CGPoint(x: 24, y: containerViewFrame.height / 4), size: CGSize(width: containerViewFrame.width - 48, height: containerViewFrame.height / 4))
        
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

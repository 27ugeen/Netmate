//
//  ProfileViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - props
    private let headerCellID = ProfileHeaderView.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    //MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Palette.appTintColor
        
        return tableView
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }

}
//MARK: - setupViews
extension ProfileViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerCellID)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedCellID, for: indexPath) as! FeedTableViewCell
        cell.separator(hide: true)
        
        return cell
        
//        switch indexPath.row {
//        case 0:
//            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: photoCellID, for: indexPath) as! PhotosTableViewCell
//            return cell
//        default:
//            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostTableViewCell
//            cell.post = PostsStorage.tableModel[indexPath.section].posts[indexPath.row - 1]
//            return cell
//        }
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "PostsStorage.tableModel[section].title"
//    }
}
//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        if indexPath.row == 0 {
//            self.goToPhotoGalleryAction?()
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 405
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ProfileHeaderView()
//        headerView.logOutAction = {
//            self.logOutAction?()
//        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
}
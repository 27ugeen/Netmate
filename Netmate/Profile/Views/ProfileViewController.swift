//
//  ProfileViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - props
    private let headerCellID = ProfileHeaderTableViewCell.cellId
    private let photoCellID = PhotoTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    var goToInfoVCAction: (() -> Void)?
    
    //MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = Palette.appTintColor
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = Palette.mainTextColor
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
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
        
        tableView.register(ProfileHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: photoCellID)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emptyCell = UITableViewCell()
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellID) as! ProfileHeaderTableViewCell
        let photoCell = tableView.dequeueReusableCell(withIdentifier: photoCellID) as! PhotoTableViewCell
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID) as! FeedTableViewCell
        
        switch indexPath.row {
        case 0:
            emptyCell.separator(hide: true)
            return emptyCell
        case 1:
            headerCell.selectionStyle = .none
            headerCell.goToInfoAction = {
                self.goToInfoVCAction?()
            }
            return headerCell
        case 2:
            photoCell.selectionStyle = .none
            return photoCell
        default:
            photoCell.selectionStyle = .none
            feedCell.separator(hide: true)
            return feedCell
        }
    }

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
        switch indexPath.row {
        case 0:
            return 0
        case 1:
            return 200
        case 2:
            return 140
        default:
            return 400
        }
    }
}

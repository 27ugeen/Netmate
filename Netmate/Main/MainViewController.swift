//
//  MainViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - props
    private let friedsListCellID = FriendsListTableViewCell.cellId
    private let feedCellID = FeedTableViewCell.cellId
    
    //MARK: - subviews
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
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
}
//MARK: - setupConstraints
extension MainViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: friedsListCellID)
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: feedCellID)
        //        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photoCellID)
        //        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: headerID)
        //
        //        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapEdit(_:)))
        //        tapGesture.numberOfTapsRequired = 2
        //        tableView.addGestureRecognizer(tapGesture)
        //
        //        tableView.dragInteractionEnabled = true
        //        tableView.dragDelegate = self
        //        tableView.dropDelegate = self
        //
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
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friedsListCell = tableView.dequeueReusableCell(withIdentifier: friedsListCellID) as! FriendsListTableViewCell
        let feedCell = tableView.dequeueReusableCell(withIdentifier: feedCellID) as! FeedTableViewCell
        
        switch indexPath.row {
        case 0:
            return friedsListCell
        default:
            feedCell.selectionStyle = .none
            return feedCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "MAIN"
    }
}
//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        default:
            return 405
        }
    }
}

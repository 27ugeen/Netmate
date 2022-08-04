//
//  ProfileFeedMenuViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import UIKit

class ProfileFeedMenuViewController: UIViewController {
    //MARK: - props
    private let menuCellID = FeedMenuTableViewCell.cellId
    private let profileFeedMenuVM: ProfileViewModel
    
    var menuAction: (() -> Void)?
    
    //MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        return tableView
    }()
    //MARK: - init
    init(profileFeedMenuVM: ProfileViewModel) {
        self.profileFeedMenuVM = profileFeedMenuVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
}
//MARK: - setupViews
extension ProfileFeedMenuViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.secondBackColor
        self.view.addSubview(tableView)
        
        tableView.register(FeedMenuTableViewCell.self, forCellReuseIdentifier: menuCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10)
        ])
    }
}
//MARK: - UITableViewDataSource
extension ProfileFeedMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileFeedMenuVM.fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: menuCellID) as! FeedMenuTableViewCell
        menuCell.menuButton.setTitle(profileFeedMenuVM.fields[indexPath.row].name, for: .normal)
        menuCell.menuAction = self.menuAction
        
        menuCell.selectionStyle = .none
        menuCell.backgroundColor = .clear
        return menuCell
    }
}
//MARK: - UITableViewDelegate
extension ProfileFeedMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 38
    }
}

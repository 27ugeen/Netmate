//
//  MainViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - props
    private let friedsListCellId = FriendsListTableViewCell.cellId
    
    //MARK: - subviews
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViews()
    }
    
}
//MARK: - setupTableView
extension MainViewController {
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = Palette.appTintColor
        
        tableView.register(FriendsListTableViewCell.self, forCellReuseIdentifier: friedsListCellId)
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
    }
}
//MARK: - setupConstraints
extension MainViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: friedsListCellId, for: indexPath) as! FriendsListTableViewCell
//        cell.imageView?.image = UIImage(named: "Tom_Cruise")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "MAIN"
    }
}
//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        tableView.deselectRow(at: indexPath, animated: true)
        //        if indexPath.row == 0 {
        //            self.goToPhotoGalleryAction?()
        //        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

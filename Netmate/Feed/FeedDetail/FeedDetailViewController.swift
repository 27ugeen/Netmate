//
//  FeedViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 2/8/2022.
//

import UIKit

class FeedDetailViewController: UIViewController {
    //MARK: - props
    private let headerCellID = FeedDetailHeaderTableViewCell.cellId
    private let postCellID = FeedDetailPostTableViewCell.cellId
    private let botCellID = FeedDetailBotTableViewCell.cellId
    
    var model: User? {
        didSet {
            tableView.reloadData()
        }
    }
    //MARK: - subviews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(16)
        label.text = "Feed"
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
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBarView()
        setupViews()
    }
    //MARK: - methods
    private func setupTabBarView() {
        let leftBarTitle = UIBarButtonItem.init(customView: titleLabel)
        self.navigationItem.setLeftBarButtonItems([backBarButton, leftBarTitle], animated: true)
        self.navigationItem.setRightBarButtonItems([menuBarButton], animated: true)
        self.navigationController?.navigationBar.tintColor = Palette.accentTextColor
    }
    @objc private func menuTapped() {
        print("feedDetail menu btn tapped")
    }
    @objc private func backTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
//MARK: - setupViews
extension FeedDetailViewController {
    private func setupViews() {
        self.view.backgroundColor = Palette.appTintColor
        self.view.addSubview(tableView)
        
        tableView.register(FeedDetailHeaderTableViewCell.self, forCellReuseIdentifier: headerCellID)
        tableView.register(FeedDetailPostTableViewCell.self, forCellReuseIdentifier: postCellID)
        tableView.register(FeedDetailBotTableViewCell.self, forCellReuseIdentifier: botCellID)
//
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
extension FeedDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellID) as! FeedDetailHeaderTableViewCell
        let postCell = tableView.dequeueReusableCell(withIdentifier: postCellID) as! FeedDetailPostTableViewCell
        let botCell = tableView.dequeueReusableCell(withIdentifier: botCellID) as! FeedDetailBotTableViewCell

        switch indexPath.row {
        case 0:
            headerCell.selectionStyle = .none
            headerCell.avatarImage.image = model?.avatar
            headerCell.nicknameLabel.text = model?.nickName
            headerCell.profLabel.text = model?.profession
            return headerCell
        case 1:
            postCell.selectionStyle = .none
            postCell.postImageView.image = model?.feed[0].image
            postCell.postLabel.text = model?.feed[0].article
            return postCell
        default:
            botCell.selectionStyle = .none
            return botCell
        }
    }

}
//MARK: - UITableViewDelegate
extension FeedDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 61
        case 1:
            //TODO: - need height for context
            return 400
        default:
            return 40
        }
    }
}

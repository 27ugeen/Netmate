//
//  ProfileSettingsViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 30/7/2022.
//

import UIKit

class MenuViewController: UIViewController {
    //MARK: - props
    private let menuCell = MenuTableViewCell.cellId
    private let menuVM: MenuViewModel
    
    var backAction: (() -> Void)?
    
    //MARK: - subviews
    private lazy var backButton: UIButton = MagicButton(title: "", titleColor: Palette.appTintColor) {
        print("menu back button tapped")
        self.backAction?()
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = "Gin Eugene"
        return label
    }()
    
    private lazy var topHLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.separatorColor
        return image
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        
        return tableView
    }()
    
    private lazy var botHLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.separatorColor
        return image
    }()
    
    private lazy var logOutButton = RadioButtonView(title: "Log Out", titleColor: Palette.mainTextColor, titleFont: UIFont.setNormFont(14), isSelected: false, imgSize: CGSize(width: 20, height: 20), imgPadding: 14) {
        print("logOut menu btn tapped")
    }
    
    
    //MARK: - init
    init(menuVM: MenuViewModel) {
        self.menuVM = menuVM
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
extension MenuViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.secondBackColor
        self.backButton.setBackgroundImage(UIImage(named: "backArrow"), for: .normal)
        self.logOutButton.radioImageView.image = UIImage(systemName: "xmark.octagon")
        self.logOutButton.radioImageView.tintColor = .systemRed
        
        self.view.addSubview(backButton)
        self.view.addSubview(nameLabel)
        self.view.addSubview(topHLineImageView)
        self.view.addSubview(tableView)
        self.view.addSubview(botHLineImageView)
        self.view.addSubview(logOutButton)
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: menuCell)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 25),
            
            topHLineImageView.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            topHLineImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            topHLineImageView.widthAnchor.constraint(equalToConstant: view.frame.width / (4/3) - 48),
            topHLineImageView.heightAnchor.constraint(equalToConstant: 0.5),
            
            tableView.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topHLineImageView.bottomAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(menuVM.fields.count * 32)),
            
            botHLineImageView.leadingAnchor.constraint(equalTo: topHLineImageView.leadingAnchor),
            botHLineImageView.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            botHLineImageView.widthAnchor.constraint(equalTo: topHLineImageView.widthAnchor),
            botHLineImageView.heightAnchor.constraint(equalTo: topHLineImageView.heightAnchor),
            
            logOutButton.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            logOutButton.topAnchor.constraint(equalTo: botHLineImageView.bottomAnchor, constant: 15),
            logOutButton.widthAnchor.constraint(equalToConstant: 100),
            logOutButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
//MARK: - UITableViewDataSource
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuVM.fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: menuCell) as! MenuTableViewCell
        menuCell.menuButton.radioImageView.image = menuVM.fields[indexPath.row].image
        menuCell.menuButton.radioLabel.text = menuVM.fields[indexPath.row].title
        menuCell.menuButton.radioImageView.tintColor = Palette.mainTextColor
        
        menuCell.selectionStyle = .none
        menuCell.backgroundColor = .clear
        return menuCell
    }
}
//MARK: - UITableViewDelegate
extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
}

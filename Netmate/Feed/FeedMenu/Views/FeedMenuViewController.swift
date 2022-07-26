//
//  FeedMenuViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import UIKit

class FeedMenuViewController: UIViewController {
    //MARK: - props
    private let menuCellID = FeedMenuTableViewCell.cellId
    private let feedMenuVM: FeedMenuViewModel
    
    var menuAction: (() -> Void)?
    
    //MARK: - subviews
    private lazy var hLineButton = MagicButton(title: "", titleColor: Palette.mainTextColor) {
        self.menuAction?()
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        return tableView
    }()
    //MARK: - init
    init(feedMenuVM: FeedMenuViewModel) {
        self.feedMenuVM = feedMenuVM
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
extension FeedMenuViewController {
    private func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.secondBackColor

        self.hLineButton.setBackgroundColor(Palette.mainTextColor, forState: .normal)
        self.hLineButton.setBackgroundColor(Palette.accentTextColor, forState: .highlighted)
        self.view.addSubview(hLineButton)
        self.view.addSubview(tableView)
        
        tableView.register(FeedMenuTableViewCell.self, forCellReuseIdentifier: menuCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            hLineButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hLineButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            hLineButton.widthAnchor.constraint(equalToConstant: 50),
            hLineButton.heightAnchor.constraint(equalToConstant: 2),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            tableView.topAnchor.constraint(equalTo: hLineButton.bottomAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension FeedMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedMenuVM.fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuCell = tableView.dequeueReusableCell(withIdentifier: menuCellID) as! FeedMenuTableViewCell
        menuCell.menuButton.setTitle(feedMenuVM.fields[indexPath.row].name, for: .normal)
        menuCell.menuAction = self.menuAction
        
        menuCell.selectionStyle = .none
        menuCell.backgroundColor = .clear
        return menuCell
    }
}
//MARK: - UITableViewDelegate
extension FeedMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
}

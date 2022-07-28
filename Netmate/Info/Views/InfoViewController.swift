//
//  InfoViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import UIKit

class InfoViewController: UIViewController {
    //MARK: - props
    private let infoVM: InfoViewModel
    
    private let infoCell = InfoTableViewCell.cellId
    
    //MARK: - subviews
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = Palette.separatorColor
        
        return tableView
    }()
    //MARK: - init
    init(infoVM: InfoViewModel) {
        self.infoVM = infoVM
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
extension InfoViewController {
    private func setupViews() {
        self.view.backgroundColor = Palette.secondBackColor.withAlphaComponent(0.95)
        self.view.addSubview(tableView)
        
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: infoCell)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoVM.fields.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infoCell = tableView.dequeueReusableCell(withIdentifier: infoCell) as! InfoTableViewCell
        infoCell.nameLabel.text = infoVM.fields[indexPath.row].name
        infoCell.valueLabel.text = infoVM.fields[indexPath.row].value
        
        infoCell.selectionStyle = .none
        infoCell.backgroundColor = .clear
        return infoCell
    }
}
//MARK: - UITableViewDelegate
extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}

//
//  InfoViewController.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import UIKit

class InfoViewController: UIViewController {
    //MARK: - props
    private let infoCellID = InfoTableViewCell.cellId
    private let infoVM: InfoViewModel
    
    var cancelAction: (() -> Void)?
    //MARK: - localization
    private let titleProfile = "info_title".localized()
    
    //MARK: - subviews
    private lazy var cancelButton: UIButton = MagicButton(title: "", titleColor: Palette.appTintColor) {
        print("info cancel button tapped")
        self.cancelAction?()
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = titleProfile
        return label
    }()
    
    private lazy var hLineImageView: UIImageView = {
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
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Palette.secondBackColor
        self.cancelButton.setBackgroundImage(UIImage(named: "cancel"), for: .normal)
        
        self.view.addSubview(cancelButton)
        self.view.addSubview(titleLabel)
        self.view.addSubview(hLineImageView)
        self.view.addSubview(tableView)
        
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: infoCellID)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 24),
            cancelButton.heightAnchor.constraint(equalTo: cancelButton.widthAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 25),
            
            hLineImageView.leadingAnchor.constraint(equalTo: cancelButton.leadingAnchor),
            hLineImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            hLineImageView.widthAnchor.constraint(equalToConstant: view.frame.width / (4/3) - 48),
            hLineImageView.heightAnchor.constraint(equalToConstant: 0.5),
            
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            tableView.topAnchor.constraint(equalTo: hLineImageView.bottomAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
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
        let infoCell = tableView.dequeueReusableCell(withIdentifier: infoCellID) as! InfoTableViewCell
        infoCell.infoButton.setTitle(infoVM.fields[indexPath.row].name, for: .normal)
        
        infoCell.selectionStyle = .none
        infoCell.backgroundColor = .clear
        return infoCell
    }
}
//MARK: - UITableViewDelegate
extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
}

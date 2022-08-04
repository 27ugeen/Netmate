//
//  ProfileSubscribtionTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import UIKit

class ProfileSubscribtionTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "ProfileSubscribtionTableViewCell"
    
    //MARK: - localization
    
    //MARK: - subViews
    private lazy var publicationsButton = MagicButton(title: "1400\npublications", titleColor: Palette.mainTextColor) {
        print("subscription publications btn tapped")
    }
    
    private lazy var subscriptionsButton = MagicButton(title: "477\nsubscriptions", titleColor: Palette.mainTextColor) {
        print("subscription subscriptionS btn tapped")
    }
    
    private lazy var subscribersButton = MagicButton(title: "161 thous.\nsubscribers", titleColor: Palette.mainTextColor) {
        print("subscription subscribers btn tapped")
    }
    
    private lazy var separator = Separator(backgroundColor: Palette.separatorColor)
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupButtons()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - methods
    private func setupButtons() {
        publicationsButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        publicationsButton.titleLabel?.font = UIFont.setNormFont(14)
        publicationsButton.titleLabel?.numberOfLines = 2
        publicationsButton.titleLabel?.textAlignment = .center
        publicationsButton.titleLabel?.lineBreakMode = .byWordWrapping
        
        subscriptionsButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        subscriptionsButton.titleLabel?.font = UIFont.setNormFont(14)
        subscriptionsButton.titleLabel?.numberOfLines = 2
        subscriptionsButton.titleLabel?.textAlignment = .center
        subscriptionsButton.titleLabel?.lineBreakMode = .byWordWrapping
        
        subscribersButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        subscribersButton.titleLabel?.font = UIFont.setNormFont(14)
        subscribersButton.titleLabel?.numberOfLines = 2
        subscribersButton.titleLabel?.textAlignment = .center
        subscribersButton.titleLabel?.lineBreakMode = .byWordWrapping
    }
}
//MARK: - setupViews
extension ProfileSubscribtionTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(publicationsButton)
        contentView.addSubview(subscriptionsButton)
        contentView.addSubview(subscribersButton)
        contentView.addSubview(separator)
        
        NSLayoutConstraint.activate([
            publicationsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            publicationsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            publicationsButton.heightAnchor.constraint(equalToConstant: 60),
            
            subscriptionsButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            subscriptionsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            subscriptionsButton.heightAnchor.constraint(equalToConstant: 60),
            
            subscribersButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            subscribersButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            subscribersButton.heightAnchor.constraint(equalToConstant: 60),
            
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

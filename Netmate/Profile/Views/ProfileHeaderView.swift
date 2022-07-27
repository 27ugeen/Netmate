//
//  ProfileHeaderView.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    //MARK: - props
    static let cellId = "ProfileHeaderView"

    //MARK: - localization
    
    //MARK: - subViews
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setNormFont(16)
        label.text = "gin_apple_sd"
        return label
    }()
    
    private lazy var menuButton: UIButton = MagicButton(title: "", titleColor: Palette.appTintColor) {
        print("header menu button tapped")
    }
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "surfer")
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = "Gin Eugene"
        return label
    }()
    
    private lazy var profLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.secondTextColor
        label.font = UIFont.setNormFont(12)
        label.text = "Apple developer"
        return label
    }()
    
    
    private lazy var exclamatImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "exclamat")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var detailButton = MagicButton(title: "Detail information", titleColor: Palette.mainTextColor) {
        print("header detail button tapped")
    }
    
    private lazy var editButton = MagicButton(title: "Edit profile", titleColor: Palette.appTintColor) {
        print("header edit button tapped")
    }
    
    //MARK: - init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupButtons()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    //MARK: - methods
    private func setupButtons() {
        menuButton.setBackgroundImage(UIImage(named: "3lines"), for: .normal)
        
        detailButton.titleLabel?.font = UIFont.setMedFont(14)
        detailButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        
        editButton.setTitleColor(Palette.mainTextColor, for: .highlighted)
        editButton.setBackgroundColor(Palette.accentTextColor, forState: .normal)
        editButton.titleLabel?.font = UIFont.setMedFont(16)
        editButton.layer.cornerRadius = 8
        editButton.clipsToBounds = true
    }
}
//MARK: - setupViews
extension ProfileHeaderView {
    private func setupViews() {
        addSubview(titleLabel)
        addSubview(menuButton)
        addSubview(avatarImage)
        addSubview(fullNameLabel)
        addSubview(profLabel)
        addSubview(exclamatImage)
        addSubview(detailButton)
        addSubview(editButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 26),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            menuButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            menuButton.widthAnchor.constraint(equalToConstant: 20),
            menuButton.heightAnchor.constraint(equalToConstant: 10),
            
            avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 26),
            avatarImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            avatarImage.widthAnchor.constraint(equalToConstant: 60),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            fullNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 22),
            
            profLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            profLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 3),
            
            exclamatImage.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            exclamatImage.topAnchor.constraint(equalTo: profLabel.bottomAnchor, constant: 5),
            exclamatImage.widthAnchor.constraint(equalToConstant: 20),
            exclamatImage.heightAnchor.constraint(equalTo: exclamatImage.widthAnchor),
            
            detailButton.leadingAnchor.constraint(equalTo: exclamatImage.trailingAnchor, constant: 8),
            detailButton.topAnchor.constraint(equalTo: profLabel.bottomAnchor, constant: 5),
            detailButton.heightAnchor.constraint(equalToConstant: 20),
            
            editButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            editButton.topAnchor.constraint(equalTo: detailButton.bottomAnchor, constant: 25),
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            editButton.heightAnchor.constraint(equalToConstant: 47)
            
        ])
    }
}

//
//  ProfileHeaderView.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "ProfileHeaderTableViewCell"
    
    var goToInfoAction: (() -> Void)?
    var goToEditAction: (() -> Void)?
    
    //MARK: - localization
    
    //MARK: - subViews
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
        label.text = "Apple software developer"
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
        self.goToInfoAction?()
    }
    
    private lazy var editButton = MagicButton(title: "Edit profile", titleColor: Palette.appTintColor) {
        print("header edit button tapped")
        self.goToEditAction?()
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
extension ProfileHeaderTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(avatarImage)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(profLabel)
        contentView.addSubview(exclamatImage)
        contentView.addSubview(detailButton)
        contentView.addSubview(editButton)
        contentView.addSubview(separator)
        
        NSLayoutConstraint.activate([
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            avatarImage.widthAnchor.constraint(equalToConstant: 60),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 10),
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            
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
            editButton.heightAnchor.constraint(equalToConstant: 47),
            
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separator.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 15),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

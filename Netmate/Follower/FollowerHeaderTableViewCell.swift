//
//  FollowerHeaderTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 1/8/2022.
//

import UIKit

class FollowerHeaderTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FollowerHeaderTableViewCell"
    
    var goToInfoAction: (() -> Void)?
    
    //MARK: - subviews
    private lazy var topSeparator = Separator(backgroundColor: Palette.separatorColor)
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Margot_Robbie_2")
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = "Margot Robbie"
        return label
    }()
    
    private lazy var profLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.secondTextColor
        label.font = UIFont.setNormFont(14)
        label.text = "Actor"
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
        print("follower detail button tapped")
        self.goToInfoAction?()
    }
    
    private lazy var messageButton = MagicButton(title: "Message", titleColor: Palette.btnWithBordTitleColor) {
        print("follower message button tapped")
//        self.goToEditAction?()
    }
    
    private lazy var phoneButton = MagicButton(title: "Phone", titleColor: Palette.btnWithBordTitleColor) {
        print("follower phone button tapped")
//        self.goToEditAction?()
    }
    
    private lazy var botSeparator = Separator(backgroundColor: Palette.separatorColor)
    
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
        
        messageButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        messageButton.setBackgroundColor(Palette.btnWithBordColor, forState: .normal)
        messageButton.titleLabel?.font = UIFont.setMedFont(14)
        messageButton.layer.cornerRadius = 8
        messageButton.clipsToBounds = true
        
        phoneButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        phoneButton.setBackgroundColor(Palette.btnWithBordColor, forState: .normal)
        phoneButton.titleLabel?.font = UIFont.setMedFont(14)
        phoneButton.layer.cornerRadius = 8
        phoneButton.clipsToBounds = true
    }

}
//MARK: - setupViews
extension FollowerHeaderTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(topSeparator)
        contentView.addSubview(avatarImage)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(profLabel)
        contentView.addSubview(exclamatImage)
        contentView.addSubview(detailButton)
        contentView.addSubview(messageButton)
        contentView.addSubview(phoneButton)
        contentView.addSubview(botSeparator)
        
        NSLayoutConstraint.activate([
            topSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            topSeparator.topAnchor.constraint(equalTo: contentView.topAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            topSeparator.heightAnchor.constraint(equalToConstant: 0.5),
            
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            avatarImage.widthAnchor.constraint(equalToConstant: 80),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 15),
            fullNameLabel.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 15),
            
            profLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            profLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 5),
            
            exclamatImage.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            exclamatImage.topAnchor.constraint(equalTo: profLabel.bottomAnchor, constant: 5),
            exclamatImage.widthAnchor.constraint(equalToConstant: 20),
            exclamatImage.heightAnchor.constraint(equalTo: exclamatImage.widthAnchor),
            
            detailButton.leadingAnchor.constraint(equalTo: exclamatImage.trailingAnchor, constant: 8),
            detailButton.topAnchor.constraint(equalTo: profLabel.bottomAnchor, constant: 5),
            detailButton.heightAnchor.constraint(equalToConstant: 20),
            
            messageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            messageButton.topAnchor.constraint(equalTo: detailButton.bottomAnchor, constant: 25),
            messageButton.heightAnchor.constraint(equalToConstant: 45),
            
            phoneButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 24),
            phoneButton.topAnchor.constraint(equalTo: detailButton.bottomAnchor, constant: 23),
            phoneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            phoneButton.widthAnchor.constraint(equalTo: messageButton.widthAnchor),
            phoneButton.heightAnchor.constraint(equalTo: messageButton.heightAnchor),
            
            botSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            botSeparator.topAnchor.constraint(equalTo: messageButton.bottomAnchor, constant: 15),
            botSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            botSeparator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            botSeparator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

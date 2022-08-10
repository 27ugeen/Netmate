//
//  FollowerButtonsTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 2/8/2022.
//

import UIKit

class FollowerButtonsTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FollowerButtonsTableViewCell"
    
    //MARK: - localization
    private var titleMessage = "message_btn".localized()
    private var titlePhone = "phone_btn".localized()
    
    //MARK: - subviews
    private lazy var messageButton = MagicButton(title: titleMessage, titleColor: Palette.btnWithBordTitleColor) {
        print("follower message button tapped")
    }
    
    private lazy var phoneButton = MagicButton(title: titlePhone, titleColor: Palette.btnWithBordTitleColor) {
        print("follower phone button tapped")
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
extension FollowerButtonsTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(messageButton)
        contentView.addSubview(phoneButton)
        contentView.addSubview(botSeparator)
        
        NSLayoutConstraint.activate([
            messageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            messageButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            messageButton.heightAnchor.constraint(equalToConstant: 45),
            
            phoneButton.leadingAnchor.constraint(equalTo: messageButton.trailingAnchor, constant: 24),
            phoneButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            phoneButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            phoneButton.widthAnchor.constraint(equalTo: messageButton.widthAnchor),
            phoneButton.heightAnchor.constraint(equalTo: messageButton.heightAnchor),
            
            botSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            botSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            botSeparator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            botSeparator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

//
//  ProfileButtonsTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 2/8/2022.
//

import UIKit

class ProfileButtonsTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "ProfileButtonsTableViewCell"
    
    var goToEditAction: (() -> Void)?
    
    //MARK: - localization
    private let titleEdit = "edit_btn".localized()
    
    //MARK: - subViews
    private lazy var editButton = MagicButton(title: titleEdit, titleColor: Palette.appTintColor) {
        print("header edit button tapped")
        self.goToEditAction?()
    }
    
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
        editButton.setTitleColor(Palette.mainTextColor, for: .highlighted)
        editButton.setBackgroundColor(Palette.accentTextColor, forState: .normal)
        editButton.titleLabel?.font = UIFont.setMedFont(16)
        editButton.layer.cornerRadius = 8
        editButton.clipsToBounds = true
    }
}
//MARK: - setupViews
extension ProfileButtonsTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(editButton)
        
        NSLayoutConstraint.activate([
            editButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            editButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}


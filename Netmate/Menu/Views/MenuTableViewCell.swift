//
//  ProfileSettingsTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 30/7/2022.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "MenuTableViewCell"
    
    //MARK: - subviews
    lazy var menuButton = RadioButtonView(title: "", titleColor: Palette.mainTextColor, titleFont: UIFont.setNormFont(14), isSelected: false, imgSize: CGSize(width: 20, height: 20), imgPadding: 14) {
        print("menu cell btn tapped")
    }
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - methods
    private func setupViews() {
        contentView.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            menuButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 100),
            menuButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

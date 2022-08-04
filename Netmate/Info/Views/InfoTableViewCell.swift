//
//  InfoTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "InfoTableViewCell"
    
    //MARK: - subviews
    lazy var infoButton = MagicButton(title: "", titleColor: Palette.mainTextColor) {
        print("info btn tapped")
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
        infoButton.titleLabel?.font = UIFont.setNormFont(14)
        infoButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        contentView.addSubview(infoButton)
        
        NSLayoutConstraint.activate([
            infoButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            infoButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            infoButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}


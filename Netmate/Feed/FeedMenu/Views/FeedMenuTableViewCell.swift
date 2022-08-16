//
//  FeedMenuTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import UIKit

class FeedMenuTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FeedMenuTableViewCell"
    
    var menuAction: (() -> Void)?
    
    //MARK: - subviews
    lazy var menuButton = MagicButton(title: "", titleColor: Palette.mainTextColor) {
        self.menuAction?()
        print("feed menu btn tapped")
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
        menuButton.titleLabel?.font = UIFont.setNormFont(14)
        menuButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
        contentView.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            menuButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            menuButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            menuButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

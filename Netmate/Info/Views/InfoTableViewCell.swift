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
    
//    lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = Palette.secondTextColor
//        label.font = UIFont.setMedFont(12)
//        label.text = "nameLabel"
//        return label
//    }()
//
//    lazy var valueLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = Palette.mainTextColor
//        label.font = UIFont.setNormFont(14)
//        label.text = "valueLabel"
//        return label
//    }()
    
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


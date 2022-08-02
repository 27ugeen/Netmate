//
//  FeedDetailHeaderTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 2/8/2022.
//

import UIKit

class FeedDetailHeaderTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FeedDetailHeaderTableViewCell"
    
    //MARK: - subviews
    private lazy var topSeparator = Separator(backgroundColor: Palette.separatorColor)
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Margot_Robbie_2")
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var nicknameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.accentTextColor
        label.font = UIFont.setMedFont(12)
        label.text = "follower_nickname"
        return label
    }()
    
    private lazy var proffLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.secondTextColor
        label.font = UIFont.setNormFont(12)
        label.text = "follower_proff"
        return label
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - setupViews
extension FeedDetailHeaderTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(topSeparator)
        contentView.addSubview(avatarImage)
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(proffLabel)
        
        NSLayoutConstraint.activate([
            topSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            topSeparator.topAnchor.constraint(equalTo: contentView.topAnchor),
            topSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            topSeparator.heightAnchor.constraint(equalToConstant: 0.5),
            
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            avatarImage.topAnchor.constraint(equalTo: topSeparator.bottomAnchor, constant: 18),
            avatarImage.widthAnchor.constraint(equalToConstant: 30),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            nicknameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
            nicknameLabel.topAnchor.constraint(equalTo: avatarImage.topAnchor),
            
            proffLabel.leadingAnchor.constraint(equalTo: nicknameLabel.leadingAnchor),
            proffLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor),
        ])
    }
}

//
//  FeedDetailBotTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 2/8/2022.
//

import UIKit

class FeedDetailBotTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FeedDetailBotTableViewCell"
    
    //MARK: - subviews
    private lazy var likesImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "heart")?.withTintColor(Palette.mainTextColor)
        return image
    }()
    
    private lazy var likesLabel: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.setNormFont(14)
        likes.textColor = Palette.mainTextColor
        likes.text = "42"
        return likes
    }()
    
    private lazy var commentsImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "speech_bubble")?.withTintColor(Palette.mainTextColor)
        return image
    }()
    
    private lazy var commentsLabel: UILabel = {
        let comments = UILabel()
        comments.translatesAutoresizingMaskIntoConstraints = false
        comments.font = UIFont.setNormFont(14)
        comments.textColor = Palette.mainTextColor
        comments.text = "42"
        return comments
    }()
    
    private lazy var bookmarkImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "bookmark")?.withTintColor(Palette.mainTextColor)
        return image
    }()
    
    private lazy var botSeparator = Separator(backgroundColor: Palette.separatorColor)
    
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
extension FeedDetailBotTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(likesImageView)
        contentView.addSubview(likesLabel)
        contentView.addSubview(commentsImageView)
        contentView.addSubview(commentsLabel)
        contentView.addSubview(bookmarkImageView)
        contentView.addSubview(botSeparator)
        
        NSLayoutConstraint.activate([
            likesImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            likesImageView.widthAnchor.constraint(equalToConstant: 24),
            likesImageView.heightAnchor.constraint(equalTo: likesImageView.widthAnchor),
            
            likesLabel.leadingAnchor.constraint(equalTo: likesImageView.trailingAnchor, constant: 10),
            likesLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            commentsImageView.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor, constant: 24),
            commentsImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            commentsImageView.widthAnchor.constraint(equalToConstant: 24),
            commentsImageView.heightAnchor.constraint(equalTo: commentsImageView.widthAnchor),
            
            commentsLabel.leadingAnchor.constraint(equalTo: commentsImageView.trailingAnchor, constant: 10),
            commentsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            bookmarkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bookmarkImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bookmarkImageView.widthAnchor.constraint(equalToConstant: 20),
            bookmarkImageView.heightAnchor.constraint(equalToConstant: 24),
            
            botSeparator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            botSeparator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            botSeparator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            botSeparator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

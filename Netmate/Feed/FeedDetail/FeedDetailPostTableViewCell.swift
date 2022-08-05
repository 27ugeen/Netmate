//
//  FeedDetailPostTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 2/8/2022.
//

import UIKit

class FeedDetailPostTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FeedDetailPostTableViewCell"
    
    //MARK: - subviews
    lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = Palette.secondBackColor
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
    }()
    
    lazy var postLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setNormFont(14)
        label.numberOfLines = 0
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
extension FeedDetailPostTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(postImageView)
        contentView.addSubview(postLabel)
        
        NSLayoutConstraint.activate([
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
            
            postLabel.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor),
            postLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 15),
            postLabel.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor),
            postLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
}

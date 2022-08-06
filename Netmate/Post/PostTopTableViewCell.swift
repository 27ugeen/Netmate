//
//  PostTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

class PostTopTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "PostTopTableViewCell"
    
    var showMoreAction: (() -> Void)?
    
    //MARK: - localization
    private let showMore = "show_more_btn".localized()

    //MARK: - subviews
    private lazy var vLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.mainTextColor
        return image
    }()
    
    lazy var postDescriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont.setNormFont(14)
        description.textColor = Palette.mainTextColor
        description.numberOfLines = 4
        return description
    }()
    
    private lazy var showMoreButton = MagicButton(title: showMore, titleColor: Palette.linkTextcolor) {
        print("showMore btn post tapped")
        self.showMoreAction?()
    }
    
    lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.backgroundColor = Palette.secondBackColor
        image.image = UIImage(named: "Gal_Gadot")
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        return image
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
extension PostTopTableViewCell {
    private func setupViews() {
        self.showMoreButton.titleLabel?.font = UIFont.setSBFont(12)
        contentView.backgroundColor = Palette.secondBackColor
        contentView.addSubview(vLineImageView)
        contentView.addSubview(postDescriptionLabel)
        contentView.addSubview(showMoreButton)
        contentView.addSubview(postImageView)
        
        NSLayoutConstraint.activate([
            vLineImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            vLineImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            vLineImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            vLineImageView.widthAnchor.constraint(equalToConstant: 1),
            
            postDescriptionLabel.leadingAnchor.constraint(equalTo: vLineImageView.trailingAnchor, constant: 24),
            postDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            showMoreButton.leadingAnchor.constraint(equalTo: vLineImageView.trailingAnchor, constant: 24),
            showMoreButton.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 3),
            showMoreButton.heightAnchor.constraint(equalToConstant: 15),

            postImageView.leadingAnchor.constraint(equalTo: vLineImageView.leadingAnchor, constant: 24),
            postImageView.topAnchor.constraint(equalTo: showMoreButton.bottomAnchor, constant: 15),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            postImageView.widthAnchor.constraint(equalTo: postDescriptionLabel.widthAnchor),
            postImageView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
}

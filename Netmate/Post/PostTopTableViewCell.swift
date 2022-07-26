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
    
//    var post: Post? {
//        didSet {
//            postAuthorLabel.text = "\(postAuthor): \(String(describing: (post?.author ?? "unknown")))"
//            postTitleLabel.text = post?.title
//            postImageView.image = post?.image
//            postDescriptionLabel.text = post?.descript
//            postlikesLabel.text = String.localizedStringWithFormat(postLikes, (post?.likes ?? 0))
//            postViewsLabel.text = "\(postViews): \(String(describing: (post?.views ?? 0)))"
//        }
//    }
    //MARK: - localization
    
    //MARK: - subviews
    private let vLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = Palette.appTintColor
        image.image = UIImage(named: "vLine")
        return image
    }()
    
    private let postDescriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        description.textColor = .systemGray
        description.numberOfLines = 0
        description.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return description
    }()
    
    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = Palette.appTintColor
        image.image = UIImage(named: "Gal_Gadot")
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
        contentView.addSubview(vLineImageView)
        contentView.addSubview(postDescriptionLabel)
        contentView.addSubview(postImageView)
        
        NSLayoutConstraint.activate([
            vLineImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            vLineImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            vLineImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            vLineImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -40),
            vLineImageView.widthAnchor.constraint(equalToConstant: 1),
            
            postDescriptionLabel.leadingAnchor.constraint(equalTo: vLineImageView.trailingAnchor, constant: 24),
            postDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),

            postImageView.leadingAnchor.constraint(equalTo: vLineImageView.leadingAnchor, constant: 24),
            postImageView.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 15),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23),
            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            postImageView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
}

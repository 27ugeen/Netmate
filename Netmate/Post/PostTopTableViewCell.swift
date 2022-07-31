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
    private lazy var vLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.mainTextColor
        return image
    }()
    
    private lazy var postDescriptionLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont.setNormFont(14)
        description.textColor = Palette.mainTextColor
        description.numberOfLines = 4
        description.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        return description
    }()
    
    private lazy var showMoreLabel: UILabel = {
        let description = UILabel()
        description.translatesAutoresizingMaskIntoConstraints = false
        description.font = UIFont.setSBFont(12)
        description.textColor = Palette.linkTextcolor
        description.text = "Show more..."
        return description
    }()
    
    private lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = Palette.secondBackColor
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
        contentView.backgroundColor = Palette.secondBackColor
        contentView.addSubview(vLineImageView)
        contentView.addSubview(postDescriptionLabel)
        contentView.addSubview(showMoreLabel)
        contentView.addSubview(postImageView)
        
        NSLayoutConstraint.activate([
            vLineImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 28),
            vLineImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            vLineImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            vLineImageView.widthAnchor.constraint(equalToConstant: 1),
            
            postDescriptionLabel.leadingAnchor.constraint(equalTo: vLineImageView.trailingAnchor, constant: 24),
            postDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            showMoreLabel.leadingAnchor.constraint(equalTo: vLineImageView.trailingAnchor, constant: 24),
            showMoreLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: 3),

            postImageView.leadingAnchor.constraint(equalTo: vLineImageView.leadingAnchor, constant: 24),
            postImageView.topAnchor.constraint(equalTo: showMoreLabel.bottomAnchor, constant: 15),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -23),
//            postImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            postImageView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
}

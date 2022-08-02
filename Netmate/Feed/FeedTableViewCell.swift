//
//  PostTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FeedTableViewCell"
    private let postTopCellID = PostTopTableViewCell.cellId
    private let postBotCellID = PostBotTableViewCell.cellId
    
    var showMoreAction: (() -> Void)?
    
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
    private lazy var authorImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = Palette.appTintColor
        image.image = UIImage(named: "Gal_Gadot")
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(16)
        label.text = "Gal Gadot"
        return label
    }()
    
    private lazy var descriptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.secondTextColor
        label.font = UIFont.setNormFont(14)
        label.text = "Actor"
        return label
    }()
    
    private lazy var menuImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = Palette.appTintColor
        image.image = UIImage(named: "3dots")
        return image
    }()
    
    private let postTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.automaticallyAdjustsScrollIndicatorInsets = false
//        table.contentInsetAdjustmentBehavior = .never
        table.isScrollEnabled = false
        table.separatorStyle = .singleLine
        table.backgroundColor = Palette.appTintColor
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.separatorColor = Palette.separatorColor
        return table
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
extension FeedTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(authorImageView)
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptLabel)
        contentView.addSubview(menuImageView)
        contentView.addSubview(postTableView)
        
        postTableView.register(PostTopTableViewCell.self, forCellReuseIdentifier: postTopCellID)
        postTableView.register(PostBotTableViewCell.self, forCellReuseIdentifier: postBotCellID)

        postTableView.dataSource = self
        postTableView.delegate = self
        
        NSLayoutConstraint.activate([
            authorImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            authorImageView.widthAnchor.constraint(equalToConstant: 60),
            authorImageView.heightAnchor.constraint(equalTo: authorImageView.widthAnchor),
            
            authorLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 24),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            descriptLabel.leadingAnchor.constraint(equalTo: authorImageView.trailingAnchor, constant: 24),
            descriptLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 4),
            
            menuImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            menuImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            menuImageView.widthAnchor.constraint(equalToConstant: 5),
            menuImageView.heightAnchor.constraint(equalToConstant: 21),
            
            postTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postTableView.topAnchor.constraint(equalTo: authorImageView.bottomAnchor, constant: 12),
            postTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
//MARK: - UITableViewDataSource
extension FeedTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let postTopCell = tableView.dequeueReusableCell(withIdentifier: postTopCellID) as! PostTopTableViewCell
        let postBotCell = tableView.dequeueReusableCell(withIdentifier: postBotCellID) as! PostBotTableViewCell
        
        switch indexPath.row {
        case 0:
            postTopCell.showMoreAction = {
                self.showMoreAction?()
            }
            return postTopCell
        default:
            postBotCell.separator(hide: true)
            return postBotCell
        }
    }
}
//MARK: - UITableViewDelegate
extension FeedTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 260
        default:
            return 48
        }
    }
}

//
//  FriendListTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "FriendsListTableViewCell"
    private let collectionCellId = FriendListCollectionViewCell.cellId
    
    var goToProfileAction: (() -> Void)?
    var goToFollowerAction: ((Int) -> Void)?
    
    //MARK: - subviews
    private lazy var friendsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = Palette.appTintColor
        
        view.register(FriendListCollectionViewCell.self, forCellWithReuseIdentifier: collectionCellId)
        
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    private lazy var separator = Separator(backgroundColor: Palette.separatorColor)
    
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
extension FriendsListTableViewCell {
    private func setupViews() {
        contentView.addSubview(friendsCollectionView)
        contentView.addSubview(separator)
        
        NSLayoutConstraint.activate([
            friendsCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            friendsCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            friendsCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separator.topAnchor.constraint(equalTo: friendsCollectionView.bottomAnchor, constant: 15),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
//MARK: - UICollectionViewDataSource
extension FriendsListTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FriendsStorage.tableModel[section].friends.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = friendsCollectionView.dequeueReusableCell(withReuseIdentifier: collectionCellId, for: indexPath) as! FriendListCollectionViewCell
        
        switch indexPath.item {
        case 0:
            cell.imageView.image = UIImage(named: "surfer")
            cell.plusImageView.layer.opacity = 1
        default:
            cell.imageView.image = FriendsStorage.tableModel[indexPath.section].friends[indexPath.item - 1].avatar
        }
        
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension FriendsListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.goToProfileAction?()
        default:
            self.goToFollowerAction?(indexPath.item)
        }
        print("Index: \(indexPath.item)")
    }
}

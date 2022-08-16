//
//  FavoriteSearchHeaderView.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class FavoriteSearchHeaderView: UITableViewHeaderFooterView {
    //MARK: - props
    static let cellId = "FavoriteSearchHeaderView"
    
    //MARK: - subviews
    lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.secondTextColor
        label.font = UIFont.setMedFont(14)
        label.text = "Not filtered"
        return label
    }()
    
    private lazy var topHLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.separatorColor
        return image
    }()
    
    //MARK: - init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
}
// MARK: - setupViews
extension FavoriteSearchHeaderView {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(searchLabel)
        contentView.addSubview(topHLineImageView)
        
        NSLayoutConstraint.activate([
            searchLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            searchLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            searchLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            topHLineImageView.leadingAnchor.constraint(equalTo: searchLabel.leadingAnchor),
            topHLineImageView.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 12),
            topHLineImageView.widthAnchor.constraint(equalTo: searchLabel.widthAnchor),
            topHLineImageView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}

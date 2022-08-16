//
//  FriendListCollectionViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 26/7/2022.
//

import UIKit

class FriendListCollectionViewCell: UICollectionViewCell {
    //MARK: - props
    static let cellId = "FriendListCollectionViewCell"
    
    //MARK: - subviews
    lazy var plusImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.appTintColor
        image.image = UIImage(named: "cirlePlus")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 5
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.opacity = 0
        image.clipsToBounds = true
        return image
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.appTintColor
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 30
        image.layer.borderWidth = 1
        image.layer.borderColor = Palette.accentTextColor.cgColor
        image.clipsToBounds = true
        return image
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - methods
    private func setupViews() {
        contentView.addSubview(imageView)
        contentView.addSubview(plusImageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            plusImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -6),
            plusImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -2),
            plusImageView.widthAnchor.constraint(equalToConstant: 10),
            plusImageView.heightAnchor.constraint(equalTo: plusImageView.widthAnchor)
        ])
    }
}

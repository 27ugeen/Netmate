//
//  ProfileHeaderView.swift
//  Netmate
//
//  Created by GiN Eugene on 27/7/2022.
//

import UIKit

class ProfileHeaderTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "ProfileHeaderTableViewCell"
    
    var goToInfoAction: (() -> Void)?
    
    //MARK: - localization
    private let titleDetail = "detail_btn".localized()
    
    //MARK: - subviews
    lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "default_pic")
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = "full_name"
        return label
    }()
    
    lazy var profLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.secondTextColor
        label.font = UIFont.setNormFont(14)
        label.text = "profession"
        return label
    }()
    
    private lazy var exclamatImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "exclamat")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var detailButton = MagicButton(title: titleDetail, titleColor: Palette.mainTextColor) {
        print("follower detail button tapped")
        self.goToInfoAction?()
    }
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupButtons()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - methods
    private func setupButtons() {
        detailButton.titleLabel?.font = UIFont.setMedFont(14)
        detailButton.setTitleColor(Palette.accentTextColor, for: .highlighted)
    }
}
//MARK: - setupViews
extension ProfileHeaderTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(avatarImage)
        contentView.addSubview(fullNameLabel)
        contentView.addSubview(profLabel)
        contentView.addSubview(exclamatImage)
        contentView.addSubview(detailButton)
        
        NSLayoutConstraint.activate([
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            avatarImage.widthAnchor.constraint(equalToConstant: 80),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 15),
            fullNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            
            profLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            profLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 5),
            
            exclamatImage.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            exclamatImage.topAnchor.constraint(equalTo: profLabel.bottomAnchor, constant: 5),
            exclamatImage.widthAnchor.constraint(equalToConstant: 20),
            exclamatImage.heightAnchor.constraint(equalTo: exclamatImage.widthAnchor),
            
            detailButton.leadingAnchor.constraint(equalTo: exclamatImage.trailingAnchor, constant: 8),
            detailButton.topAnchor.constraint(equalTo: profLabel.bottomAnchor, constant: 5),
            detailButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

//
//  MainHeaderTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import UIKit

class MainHeaderTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "MainHeaderTableViewCell"
    
    //MARK: - subviews
    private lazy var friendsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setNormFont(14)
        label.text = "Friends"
        return label
    }()
    
    private lazy var hLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.accentTextColor
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
extension MainHeaderTableViewCell {
    private func setupViews() {
        contentView.addSubview(friendsLabel)
        contentView.addSubview(hLineImageView)
        
        NSLayoutConstraint.activate([
            friendsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            friendsLabel.topAnchor.constraint(equalTo: self.topAnchor),
            
            hLineImageView.leadingAnchor.constraint(equalTo: friendsLabel.leadingAnchor),
            hLineImageView.topAnchor.constraint(equalTo: friendsLabel.bottomAnchor, constant: 5),
            hLineImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            hLineImageView.widthAnchor.constraint(equalTo: friendsLabel.widthAnchor),
            hLineImageView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
    }
}

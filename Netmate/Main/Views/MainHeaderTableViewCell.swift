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
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setSBFont(18)
        label.text = "Main"
        return label
    }()
    
    private lazy var newsLabel: UILabel = {
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
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "hLine")?.withTintColor(Palette.accentTextColor)
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(newsLabel)
        contentView.addSubview(hLineImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            newsLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            newsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            
            hLineImageView.leadingAnchor.constraint(equalTo: newsLabel.leadingAnchor),
            hLineImageView.topAnchor.constraint(equalTo: newsLabel.bottomAnchor, constant: 2),
            hLineImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            //TODO: - change line width for ipad
            hLineImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            hLineImageView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
    }
}
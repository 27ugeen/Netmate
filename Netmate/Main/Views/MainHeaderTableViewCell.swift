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
    private lazy var newsButton = MagicButton(title: "News", titleColor: Palette.mainTextColor) {
        print("main news btn tapped")
    }
    
    private lazy var forUButton = MagicButton(title: "For you", titleColor: Palette.secondTextColor) {
        print("main forU btn tapped")
    }
    
    private lazy var hLineImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = Palette.accentTextColor
        return image
    }()
    
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
        newsButton.titleLabel?.font = UIFont.setNormFont(14)
        forUButton.titleLabel?.font = UIFont.setNormFont(14)
    }
}
//MARK: - setupViews
extension MainHeaderTableViewCell {
    private func setupViews() {
        contentView.addSubview(newsButton)
        contentView.addSubview(forUButton)
        contentView.addSubview(hLineImageView)
        
        NSLayoutConstraint.activate([
            newsButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newsButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsButton.widthAnchor.constraint(equalTo: newsButton.titleLabel?.widthAnchor ?? newsButton.widthAnchor),
            
            forUButton.leadingAnchor.constraint(equalTo: newsButton.trailingAnchor, constant: 38),
            forUButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            forUButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21),
            forUButton.widthAnchor.constraint(equalTo: forUButton.titleLabel?.widthAnchor ?? forUButton.widthAnchor),
            
            hLineImageView.leadingAnchor.constraint(equalTo: newsButton.leadingAnchor),
            hLineImageView.topAnchor.constraint(equalTo: newsButton.bottomAnchor, constant: 5),
            hLineImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            hLineImageView.widthAnchor.constraint(equalTo: newsButton.titleLabel?.widthAnchor ?? newsButton.widthAnchor),
            hLineImageView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

//
//  ProfileNotesTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 4/8/2022.
//

import UIKit

class ProfileNotesTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "ProfileNotesTableViewCell"
    
    //MARK: - localization
    private let notesTitle = "notes_btn".localized()
    private let historyTitle = "history_btn".localized()
    private let photoTitle = "photo_btn".localized()
    
    //MARK: - subViews
    private lazy var notesButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "square.and.pencil")
        config.imagePlacement = .top
        config.imagePadding = 12
        
        var attText = AttributedString(notesTitle)
        attText.font = UIFont.setNormFont(14)
        config.attributedTitle = attText
        config.baseForegroundColor = Palette.mainTextColor
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundColor(Palette.accentTextColor, forState: .highlighted)
        
        return btn
    }()
    
    private lazy var historyButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "camera")
        config.imagePlacement = .top
        config.imagePadding = 12
        
        var attText = AttributedString(historyTitle)
        attText.font = UIFont.setNormFont(14)
        config.attributedTitle = attText
        config.baseForegroundColor = Palette.mainTextColor
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    private lazy var photoButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "photo")
        config.imagePlacement = .top
        config.imagePadding = 12
        
        var attText = AttributedString(photoTitle)
        attText.font = UIFont.setNormFont(14)
        config.attributedTitle = attText
        config.baseForegroundColor = Palette.mainTextColor
        config.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0)
        
        let btn = UIButton(configuration: config)
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
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
extension ProfileNotesTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(notesButton)
        contentView.addSubview(historyButton)
        contentView.addSubview(photoButton)
        
        NSLayoutConstraint.activate([
            notesButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 26),
            notesButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            notesButton.heightAnchor.constraint(equalToConstant: 68),
            
            historyButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            historyButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            historyButton.heightAnchor.constraint(equalToConstant: 68),
            
            photoButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            photoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            photoButton.heightAnchor.constraint(equalToConstant: 68)
        ])
    }
}

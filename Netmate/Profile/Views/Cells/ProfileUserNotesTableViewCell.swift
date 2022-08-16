//
//  ProfileUserNotesTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 8/8/2022.
//

import UIKit

class ProfileUserNotesTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "ProfileUserNotesTableViewCell"
    
    //MARK: - localization
    private let titleMyNotes = "my_notes_title".localized()
    
    //MARK: - subViews
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.accentTextColor
        label.font = UIFont.setMedFont(16)
        label.text = titleMyNotes
        return label
    }()
    
    lazy var searchButton = MagicButton(title: "", titleColor: Palette.mainTextColor) {
        print("profile search notee btn tapped")
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
        searchButton.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = Palette.mainTextColor
    }
}
//MARK: - setupViews
extension ProfileUserNotesTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.secondBackColor
        contentView.addSubview(titleLabel)
        contentView.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            searchButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            searchButton.widthAnchor.constraint(equalToConstant: 24),
            searchButton.heightAnchor.constraint(equalTo: searchButton.widthAnchor)
        ])
    }
}

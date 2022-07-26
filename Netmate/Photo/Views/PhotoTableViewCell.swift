//
//  PhotoTableViewCell.swift
//  Netmate
//
//  Created by GiN Eugene on 28/7/2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    //MARK: - props
    static let cellId = "PhotoTableViewCell"
    
    private let photoWidth = (UIScreen.main.bounds.width - 48) / 4
    private let photoCellID = PhotoCollectionViewCell.cellId
    
    var model: [PhotoStub] = [] {
        didSet { photosPreview.reloadData() }
    }
    //MARK: - localization
        private let titlePhoto = "photo_title".localized()
    
    //MARK: - subviews
    private lazy var titleLableView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Palette.mainTextColor
        label.font = UIFont.setMedFont(16)
        label.text = titlePhoto
        return label
    }()
    
    private lazy var buttonView: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = Palette.mainTextColor
        button.addTarget(self, action: #selector(tappedNextImage), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var photosPreview: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = Palette.appTintColor
        
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: photoCellID)
        
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
    //MARK: - objc methods
    @objc private func tappedNextImage() {
        if buttonView.currentBackgroundImage == UIImage(systemName: "arrow.right") {
            let IndexPath = NSIndexPath(item: 7, section: 0)
            photosPreview.scrollToItem(at: IndexPath as IndexPath, at: .right, animated: true)
            buttonView.setBackgroundImage(UIImage(systemName: "arrow.left"), for: .normal)
        } else {
            let IndexPath = NSIndexPath(item: 0, section: 0)
            photosPreview.scrollToItem(at: IndexPath as IndexPath, at: .left, animated: true)
            buttonView.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        }
        
    }
}
//MARK: - setupViews
extension PhotoTableViewCell {
    private func setupViews() {
        contentView.backgroundColor = Palette.appTintColor
        contentView.addSubview(titleLableView)
        contentView.addSubview(buttonView)
        contentView.addSubview(photosPreview)
        contentView.addSubview(separator)
        
        NSLayoutConstraint.activate([
            titleLableView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            
            buttonView.centerYAnchor.constraint(equalTo: titleLableView.centerYAnchor),
            buttonView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonView.heightAnchor.constraint(equalToConstant: 24),
            
            photosPreview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:  12),
            photosPreview.topAnchor.constraint(equalTo: titleLableView.bottomAnchor, constant: 10),
            photosPreview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosPreview.heightAnchor.constraint(equalToConstant: photoWidth),
            
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            separator.topAnchor.constraint(equalTo: photosPreview.bottomAnchor, constant: 10),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            separator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25),
            separator.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }
}
//MARK: - UICollectionViewDataSource
extension PhotoTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosPreview.dequeueReusableCell(withReuseIdentifier: photoCellID, for: indexPath) as! PhotoCollectionViewCell
        guard model.count > 1 else { cell.imageView.image = UIImage(named: "default_img"); return cell }
        cell.imageView.image = model[indexPath.item].photo
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension PhotoTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: photoWidth, height: photoWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: -12, left: 0, bottom: -12, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Photos: item: \(indexPath.item)")
    }
}
